import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/Issue.dart';
import '../entities/comment.dart';

abstract class IssuesRepository {
  Future<Either<Failure, List<Issue>>> getAllIssues();
  Future<Either<Failure, Issue>> getIssueDetails(String id);
  Future<Either<Failure, List<Comment>>> getAllAnswersForIssue(String id);
}
