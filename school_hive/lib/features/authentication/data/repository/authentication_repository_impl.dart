import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../features/authentication/domain/domain.dart';
import '../../../../core/error/exception.dart';
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
  Future<Either<Failure, bool>> getAppInitialization() async {
    try {
      final isAppInitialized = await localDataSource.getAppInitialization();
      return Right(isAppInitialized);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserAuthCredential>> getUserAuthCredential() async {
    try {
      final result = await localDataSource.getUserAuthCredential();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> initializeApp() async {
    try {
      await localDataSource.initializeApp();
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserAuthCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userAuthCredentialModel = await remoteDataSource.login(
        email: email,
        password: password,
      );
      await localDataSource.cacheUserAuthCredential(
        userAuthCredentialModel: userAuthCredentialModel,
      );
      return Right(userAuthCredentialModel);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    } on UnauthorizedRequestException {
      return Left(UnauthorizedRequestFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearUserAuthCredentialCache();
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
