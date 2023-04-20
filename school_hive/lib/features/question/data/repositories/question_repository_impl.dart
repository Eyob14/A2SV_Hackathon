import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/presentation/usecases/usecase.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../features/authentication/domain/entities/user_auth_credential.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../datasources/question_remote_data_source.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;

  QuestionRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Question>> addQuestion({
    required String title,
    required String message,
    required List<File> archives,
  }) async {
    try {
      final issue = await remoteDataSource.addQuestion(
        title: title,
        message: message,
        archives: archives,
      );
      return Right(issue);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
