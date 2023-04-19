import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class NoReturns extends Equatable {
  final String? email;
  final String? otpToken;

  const NoReturns({this.email, this.otpToken});

  @override
  List<Object?> get props => [];
}
