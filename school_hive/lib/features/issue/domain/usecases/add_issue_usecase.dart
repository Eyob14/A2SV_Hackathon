import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/issue.dart';
import '../repositories/issue_repository.dart';

class AddIssueUsecase implements UseCase<Issue, AddIssueParams> {
  final IssueRepository repository;

  AddIssueUsecase({required this.repository});

  @override
  Future<Either<Failure, Issue>> call(AddIssueParams params) async {
    return await repository.addIssue(
      title: params.title,
      message: params.message,
      archives: params.archives,
    );
  }
}

class AddIssueParams extends Equatable {
  final String title;
  final String message;
  final List<File> archives;

  const AddIssueParams({
    required this.title,
    required this.message,
    required this.archives,
  });

  @override
  List<Object?> get props => [title, message, archives];
}
