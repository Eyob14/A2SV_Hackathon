part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

enum Status { loading, loaded, failure }

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthState extends AuthenticationState {
  final AuthenticationStatus authenticationStatus;
  final Status status;

  AuthState({
    this.status = Status.loading,
    this.authenticationStatus = AuthenticationStatus.unknown,
  });
}
