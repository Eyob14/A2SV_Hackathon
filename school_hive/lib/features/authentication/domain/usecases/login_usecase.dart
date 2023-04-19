import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/user_auth_credential.dart';
import '../repositories/authentication_repository.dart';

class LoginUsecase implements UseCase<UserAuthCredential, LoginParams> {
  final AuthenticationRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, UserAuthCredential>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
