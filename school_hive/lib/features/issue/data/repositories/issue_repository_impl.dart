import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:school_hive/features/issue/data/datasources/issue_remote_data_source.dart';
import 'package:school_hive/features/issue/domain/entities/issue.dart';

import '../../../../../core/presentation/usecases/usecase.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../features/authentication/domain/entities/user_auth_credential.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repositories/issue_repository.dart';

class IssueRepositoryImpl extends IssueRepository {
  final IssueRemoteDataSource remoteDataSource;

  IssueRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Issue>> addIssue({
    required String title,
    required String message,
    required List<File> archives,
  }) {
    // TODO: implement addIssue
    throw UnimplementedError();
  }
}
