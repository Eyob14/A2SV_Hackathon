import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/Issue.dart';
import '../repositories/issue_repository.dart';

class GetDetailsUseCase implements UseCase<Issue, IssuesDetailsParams> {
  final IssuesRepository issuesRepository;
  GetDetailsUseCase({required this.issuesRepository});
  @override
  Future<Either<Failure, Issue>> call(IssuesDetailsParams params) async {
    return await issuesRepository.getIssueDetails(params.id);
  }
}

class IssuesDetailsParams {
  final String id;

  IssuesDetailsParams({required this.id});
}
