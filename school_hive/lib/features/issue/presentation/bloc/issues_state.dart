part of 'issues_bloc.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();

  @override
  List<Object> get props => [];
}

class IssuesInitial extends IssuesState {}

class AllIssues extends IssuesState {
  final List<Issue> issues;

  const AllIssues({required this.issues});

  @override
  List<Object> get props => [issues];
}

class AllAnswersForIssues extends IssuesState {
  final List<Comment> comments;

  const AllAnswersForIssues({required this.comments});

  @override
  List<Object> get props => [comments];
}

class IssuesError extends IssuesState {
  final String message;

  const IssuesError({required this.message});

  @override
  List<Object> get props => [message];
}
