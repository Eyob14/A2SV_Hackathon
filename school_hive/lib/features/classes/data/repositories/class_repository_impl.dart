import 'package:school_hive/features/classes/domain/entities/class.dart';

import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/class_repository.dart';
import '../datasource/remote_class_data_source.dart';

class ClassesRepositoryImpl implements ClassesRepository {
  final ClassesRemoteDataSource remoteDataSource;
  ClassesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Class>>> getAllClasses() async {
    try {
      final allIssues = await remoteDataSource.getAllClass();
      return Right(allIssues);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> createClass(String name) async {
    try {
      final allIssues = await remoteDataSource.createClass(name);
      return Right(allIssues);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
