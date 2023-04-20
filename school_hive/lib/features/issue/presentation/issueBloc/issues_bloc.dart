import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../../domain/entities/Issue.dart';
import '../../domain/entities/comment.dart';
import '../../domain/usecases/get_all_answers_for_issue.dart';
import '../../domain/usecases/get_all_issue_usecase.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final GetAllIssuesUseCase getAllIssuesUseCase;
  // final GetAllAnswersForIssueUseCase getAllAnswersForIssuesUseCase;

  IssuesBloc({
    // required this.getAllAnswersForIssuesUseCase,
    required this.getAllIssuesUseCase,
  }) : super(IssuesInitial()) {
    on<GetAllIssuesEvent>(_onGetAllIssues);
    // on<GetAllAnswersForIssueEvent>(_onGetAllAnswersForIssues);
  }

  void _onGetAllIssues(
      GetAllIssuesEvent event, Emitter<IssuesState> emit) async {
    emit(IssuesInitial());
    final failureOrIssues = await getAllIssuesUseCase(NoParams());
    var issuesState = _errorOrIssues(failureOrIssues);
    emit(issuesState);
  }

  IssuesState _errorOrIssues(Either<Failure, List<Issue>> failureOrIssues) {
    return failureOrIssues.fold(
      (failure) => const IssuesError(message: "Couldn't fetch issues"),
      (issues) => AllIssues(issues: issues),
    );
  }

  // void _onGetAllAnswersForIssues(
  //     GetAllAnswersForIssueEvent event, Emitter<IssuesState> emit) async {
  //   emit(IssuesInitial());
  //   final failureOrAnswers =
  //       await getAllAnswersForIssuesUseCase(AllAnswersParams(id: event.id));
  //   var AnswersState = _errorOrAnswers(failureOrAnswers);
  //   emit(AnswersState);
  // }

  // IssuesState _errorOrAnswers(Either<Failure, List<Comment>> failureOrIssues) {
  //   return failureOrIssues.fold(
  //     (failure) => const IssuesError(message: "Couldn't fetch issues"),
  //     (answers) => AllAnswersForIssues(comments: answers),
  //   );
  // }
}
