part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final AuthModel authModel;

  AuthLoginEvent({
    required this.authModel,
  });
}

class AuthSignUpEvent extends AuthEvent {
  final AuthModel authModel;

  AuthSignUpEvent({
    required this.authModel,
  });
}
