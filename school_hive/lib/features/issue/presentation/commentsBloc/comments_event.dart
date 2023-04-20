part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class GetAllAnswersForIssueEvent extends CommentsEvent {
  final String id;

  GetAllAnswersForIssueEvent({required this.id});

  @override
  List<Object> get props => [id];
}
