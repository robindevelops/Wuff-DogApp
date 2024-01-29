// ignore_for_file: must_be_immutable, non_constant_identifier_names

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterButtonPressed extends AuthEvent {
  String? fullname;
  String? email;
  String? password;
  String? Cpassword;
  BuildContext context;

  RegisterButtonPressed(
      {required this.fullname,
      required this.email,
      required this.Cpassword,
      required this.password,
      required this.context});
}

class LoginButtonPressed extends AuthEvent {
  String? email;
  String? password;
  BuildContext context;
  LoginButtonPressed(
      {required this.email, required this.password, required this.context});
}

class LogOutButtonPressed extends AuthEvent {
  BuildContext context;
  LogOutButtonPressed({required this.context});
}

class ResetPasswordButtonPressed extends AuthEvent {
  BuildContext context;
  String email;
  ResetPasswordButtonPressed({required this.context, required this.email});
}
