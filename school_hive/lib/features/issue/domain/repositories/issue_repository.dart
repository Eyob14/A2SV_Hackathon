import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/Issue.dart';

abstract class IssuesRepository {
  Future<Either<Failure, List<Issue>>> getAllIssues();
  Future<Either<Failure, Issue>> getIssueDetails(String id);
}
