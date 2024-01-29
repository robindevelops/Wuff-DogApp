// ignore_for_file: non_constant_identifier_names, invalid_use_of_visible_for_testing_member, depend_on_referenced_packages, avoid_web_libraries_in_flutter, unnecessary_import, use_build_context_synchronously, avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterButtonPressed>(
      (event, emit) {
        RegisterUser(event.email, event.password, event.Cpassword,
            event.fullname, event.context);
      },
    );
    on<LoginButtonPressed>(
      (event, emit) {
        LoginUser(event.email, event.password, event.context);
      },
    );
    on<LogOutButtonPressed>(
      (event, emit) {
        LogOutUser(event.context);
      },
    );
    on<ResetPasswordButtonPressed>(
      (event, emit) {
        ResetPassword(event.context, event.email);
      },
    );
  }
  void LoginUser(email, password, BuildContext context) async {
    try {
      emit(LoadingState());
      print("pressed");
      if (email == "" || password == "") {
        emit(LoginError(errorMessage: "Please Fill all the Fields"));
      } else if (email is! String || !email.contains("@")) {
        emit(LoginError(errorMessage: "Please Enter valid email"));
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(LoginSuccessful(message: "Login Successful"));

        Navigator.pushNamedAndRemoveUntil(
            context, './mainpage', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginError(errorMessage: "User Not Found"));
      } else if (e.code == 'wrong-password') {
        emit(LoginError(errorMessage: "Invalid Password"));
      } else if (e.code == 'invalid-email') {
        emit(LoginError(errorMessage: "Invalid Email Format"));
      } else {
        // Handle any other FirebaseAuthException
        print("Firebase Auth Error: ${e.code}");
        emit(LoginError(errorMessage: "Invalid Email or password"));
      }
    }
  }

  void RegisterUser(
      email, password, Cpassword, fullname, BuildContext context) async {
    try {
      print("Button is pressed");
      emit(LoadingState());
      if (email == "" || password == "" || Cpassword == "" || fullname == "") {
        emit(SignUpError(errorMessage: 'Please Fill All the Fields'));
      } else if (password.length < 6) {
        emit(SignUpError(
            errorMessage: 'Password should be at least 6 characters long'));
      } else if (!email.contains("@")) {
        emit(SignUpError(errorMessage: 'Invalid Email Format'));
      } else if (password != Cpassword) {
        emit(SignUpError(errorMessage: 'Your Passwords Do Not Match'));
      } else {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Extract user ID from the UserCredential
        String userId = userCredential.user?.uid ?? '';

        // Pass the user ID to the AddUserInDataBase function
        AddUserInDataBase(userId, email, fullname, password);

        emit(SignUpSuccessful(message: "SignUp Successful You can Login Now"));

        Navigator.pushNamedAndRemoveUntil(
          context,
          './signin',
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'email-already-in-use') {
        emit(SignUpError(errorMessage: "Email Already in use by another user"));
      } else if (e.code == 'weak-password') {
        emit(SignUpError(errorMessage: "Use Strong Password"));
      }
    }
  }

  Future<void> AddUserInDataBase(
      String userId, String email, String fullname, String password) async {
    CollectionReference users = FirebaseFirestore.instance.collection("Users");

    await users.doc(userId).set(
      {
        'Full Name': fullname,
        'Email': email,
        'Password': password,
      },
    );
  }

  void LogOutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, './signin', (route) => false);
  }

  void ResetPassword(BuildContext context, email) async {
    try {
      if (email == "") {
        emit(LoginError(errorMessage: "Please Enter the Email First"));
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(
        ResetEmailSend(message: "Password reset email send. Check your inbox."),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/user-not-found') {
        emit(LoginError(errorMessage: "User not found"));
      }
    }
  }
}
