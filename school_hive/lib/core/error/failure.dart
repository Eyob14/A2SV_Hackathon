import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class InvalidAuthenticationCredentialFailure extends Failure {}

class NetworkConnectionFailure extends Failure {}

class UnauthorizedRequestFailure extends Failure {}
