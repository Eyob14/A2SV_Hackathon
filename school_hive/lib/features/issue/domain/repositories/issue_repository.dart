import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/issue.dart';

abstract class IssueRepository {
  Future<Either<Failure, Issue>> addIssue({
    required String title,
    required String message,
    required List<File> archives,
  });
}
