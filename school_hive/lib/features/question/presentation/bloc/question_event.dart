part of 'question_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class AddQuestionEvent extends QuestionsEvent {
  final String title;
  final String message;
  final List<File> archives;

  const AddQuestionEvent({
    required this.title,
    required this.message,
    required this.archives,
  });

  @override
  List<Object> get props => [title, message, archives];
}
