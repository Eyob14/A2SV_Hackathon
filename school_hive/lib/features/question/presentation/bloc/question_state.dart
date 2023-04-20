part of 'question_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitial extends QuestionsState {}

enum Status { loading, loaded, failure }

class AddQuestionState extends QuestionsState {
  final Status status;
  final Question? issue;

  const AddQuestionState({
    required this.status,
    this.issue,
  });

  @override
  List<Object> get props => [status];
}
