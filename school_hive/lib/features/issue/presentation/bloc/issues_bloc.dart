import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../../domain/entities/Issue.dart';
import '../../domain/usecases/get_all_issue_usecase.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final GetAllIssuesUseCase getAllIssuesUseCase;

  IssuesBloc({
    required this.getAllIssuesUseCase,
  }) : super(IssuesInitial()) {
    on<GetAllIssuesEvent>(_onGetAllIssues);
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
}
