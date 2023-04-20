import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/comment.dart';
import '../../domain/usecases/get_all_answers_for_issue.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetAllAnswersForIssueUseCase getAllAnswersForIssuesUseCase;

  CommentsBloc({required this.getAllAnswersForIssuesUseCase})
      : super(CommentsInitial()) {
    on<GetAllAnswersForIssueEvent>(_onGetAllAnswersForIssues);
  }

  void _onGetAllAnswersForIssues(
      GetAllAnswersForIssueEvent event, Emitter<CommentsState> emit) async {
    emit(CommentsInitial());
    final failureOrAnswers =
        await getAllAnswersForIssuesUseCase(AllAnswersParams(id: event.id));
    var AnswersState = _errorOrAnswers(failureOrAnswers);
    emit(AnswersState);
  }

  CommentsState _errorOrAnswers(
      Either<Failure, List<Comment>> failureOrIssues) {
    return failureOrIssues.fold(
      (failure) => const CommentError(message: "Couldn't fetch issues"),
      (answers) => AllAnswersForIssues(comments: answers),
    );
  }
}
