part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginErrorState extends AuthState {
  final String error;

  AuthLoginErrorState({required this.error});
}

final class AuthLoginSuccess extends AuthState {
  final String accessToken;

  AuthLoginSuccess({required this.accessToken});
}

final class AuthSignUpLoadingState extends AuthState {}

final class AuthSignUperrorState extends AuthState {
  final String error;

  AuthSignUperrorState({required this.error});
}

final class AuthSignUpSuccess extends AuthState {}
