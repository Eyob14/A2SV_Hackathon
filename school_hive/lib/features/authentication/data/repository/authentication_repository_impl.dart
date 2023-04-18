import 'package:school_hive/core/presentation/usecases/usecase.dart';
import 'package:school_hive/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:school_hive/features/authentication/domain/domain.dart';
import 'package:school_hive/features/authentication/domain/entities/user_auth_credential.dart';

import '../datasources/authentication_local_data_source.dart';
import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> getAppInitialization() {
    // TODO: implement getAppInitialization
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserAuthCredential>> getUserAuthCredential() {
    // TODO: implement getUserAuthCredential
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> initializeApp() {
    // TODO: implement initializeApp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserAuthCredential>> login(
      {required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoReturns>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
