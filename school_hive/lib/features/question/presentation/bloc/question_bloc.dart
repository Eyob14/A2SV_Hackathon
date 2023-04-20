import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/question.dart';
import '../../domain/usecases/add_question_usecase.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final AddQuestionUsecase addQuestionUsecase;

  QuestionsBloc({
    required this.addQuestionUsecase,
  }) : super(QuestionsInitial()) {
    on<AddQuestionEvent>(_onAddQuestion);
  }

  void _onAddQuestion(
      AddQuestionEvent event, Emitter<QuestionsState> emit) async {
    emit(const AddQuestionState(status: Status.loading));
    final failureOrAddQuestion = await addQuestionUsecase(
      AddQuestionParams(
        title: event.title,
        message: event.message,
        archives: event.archives,
      ),
    );
    emit(_failureOrAddQuestion(failureOrAddQuestion));
  }

  QuestionsState _failureOrAddQuestion(
      Either<Failure, Question> failureOrAddQuestion) {
    return failureOrAddQuestion.fold(
      (failure) => const AddQuestionState(status: Status.failure),
      (issue) => AddQuestionState(status: Status.loaded, issue: issue),
    );
  }
}
