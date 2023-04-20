import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/comment.dart';
import '../repositories/issue_repository.dart';

class GetAllAnswersForIssueUseCase
    implements UseCase<List<Comment>, AllAnswersParams> {
  final IssuesRepository issuesRepository;

  GetAllAnswersForIssueUseCase({required this.issuesRepository});
  @override
  Future<Either<Failure, List<Comment>>> call(AllAnswersParams params) async {
    return await issuesRepository.getAllAnswersForIssue(params.id);
  }
}

class AllAnswersParams {
  final String id;

  AllAnswersParams({required this.id});
}
