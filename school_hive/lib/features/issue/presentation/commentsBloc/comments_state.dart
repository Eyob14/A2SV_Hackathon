part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
  
  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class AllAnswersForIssues extends CommentsState {
  final List<Comment> comments;

  const AllAnswersForIssues({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentError extends CommentsState {
  final String message;

  const CommentError({required this.message});

  @override
  List<Object> get props => [message];
}