import 'package:school_hive/core/error/exception.dart';
import 'package:school_hive/features/issue/domain/entities/Issue.dart';

import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:school_hive/features/issue/domain/entities/comment.dart';

import '../../domain/repositories/issue_repository.dart';
import '../datasources/issue_remote_data_source.dart';

class IssuesRepositoryImpl extends IssuesRepository {
  final IssuesRemoteDataSource remoteDataSource;
  IssuesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Issue>>> getAllIssues() async {
    try {
      final allIssues = await remoteDataSource.getAllIssues();
      return Right(allIssues);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Issue>> getIssueDetails(String id) {
    // TODO: implement getIssueDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Comment>>> getAllAnswersForIssue(String id) async {
    try {
      final allIssues = await remoteDataSource.getAllAnswersForIssue(id);
      return Right(allIssues);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
