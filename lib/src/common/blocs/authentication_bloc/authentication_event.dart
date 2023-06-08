part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class _AuthenticationUserChangedState extends AuthenticationEvent {
  const _AuthenticationUserChangedState({required this.user});
  final UserModel user;
}

class LogoutRequestedEvent extends AuthenticationEvent {
  const LogoutRequestedEvent();
}
