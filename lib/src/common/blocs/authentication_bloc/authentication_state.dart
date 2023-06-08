part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._({
    this.status = AuthenticationStatus.unauthenticated,
    this.user = UserModel.empty,
  });

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  AuthenticationState.authenticated({required UserModel user})
      : this._(
          user: user,
          status: AuthenticationStatus.authenticated,
        );

  final AuthenticationStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}
