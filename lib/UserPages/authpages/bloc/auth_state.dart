// ignore_for_file: must_be_immutable, non_constant_identifier_names, camel_case_types

part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SignUpSuccessful extends AuthState {
  String? message;

  SignUpSuccessful({required this.message});
}

class SignUpError extends AuthState {
  String? errorMessage;

  SignUpError({required this.errorMessage});
}

class LoginError extends AuthState {
  final String errorMessage;

  LoginError({required this.errorMessage});
}

class LoginSuccessful extends AuthState {
  String? message;

  LoginSuccessful({required this.message});
}

class ResetEmailSend extends AuthState {
  String? message;

  ResetEmailSend({required this.message});
}

class UserDataLoadedState extends AuthState {
  final Map<String, dynamic> userData;

  UserDataLoadedState({required this.userData});
}

class LoadingState extends AuthState {}
