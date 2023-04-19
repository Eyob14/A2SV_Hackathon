import 'package:school_hive/core/error/exception.dart';

import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:school_hive/features/profile/domain/entities/profile.dart';

import '../../domain/repository/profile_repo.dart';
import '../datasource/profile_remote_data_source.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Profile>> editProfileDetail(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> getProfileInfo() async {
    try {
      final profileInfo = await remoteDataSource.getProfileInfo();
      return Right(profileInfo);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
