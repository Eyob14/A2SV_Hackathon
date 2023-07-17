import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_auth_credential.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserAuthCredential>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserAuthCredential>> getUserAuthCredential();

  Future<Either<Failure, void>> initializeApp();
  Future<Either<Failure, bool>> getAppInitialization();
}
