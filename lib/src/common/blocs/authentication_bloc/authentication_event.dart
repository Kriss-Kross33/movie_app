part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class _AuthenticationUserChangedState extends AuthenticationEvent {
  const _AuthenticationUserChangedState({required this.user});
  final UserModel user;

  @override
  List<Object> get props => [user];
}

class LogoutRequestedEvent extends AuthenticationEvent {
  const LogoutRequestedEvent();
}
