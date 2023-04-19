import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/Issue.dart';
import '../repositories/issue_repository.dart';

class GetAllIssuesUseCase implements UseCase<List<Issue>, NoParams> {
  final IssuesRepository issuesRepository;

  GetAllIssuesUseCase({required this.issuesRepository});

  @override
  Future<Either<Failure, List<Issue>>> call(NoParams params) async {
    return await issuesRepository.getAllIssues();
  }
}
