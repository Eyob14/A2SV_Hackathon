import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:school_hive/features/issue/domain/usecases/add_issue_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/issue.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final AddIssueUsecase addIssueUsecase;

  IssuesBloc({
    required this.addIssueUsecase,
  }) : super(IssuesInitial()) {
    on<AddIssueEvent>(_onAddIssue);
  }

  void _onAddIssue(AddIssueEvent event, Emitter<IssuesState> emit) async {
    emit(const AddIssueState(status: Status.loading));
    final failureOrAddIssue = await addIssueUsecase(
      AddIssueParams(
        title: event.title,
        message: event.message,
        archives: event.archives,
      ),
    );
    emit(_failureOrAddIssue(failureOrAddIssue));
  }

  IssuesState _failureOrAddIssue(Either<Failure, Issue> failureOrAddIssue) {
    return failureOrAddIssue.fold(
      (failure) => const AddIssueState(status: Status.failure),
      (issue) => AddIssueState(status: Status.loaded, issue: issue),
    );
  }
}
