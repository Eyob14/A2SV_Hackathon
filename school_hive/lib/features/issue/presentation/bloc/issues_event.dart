part of 'issues_bloc.dart';

abstract class IssuesEvent extends Equatable {
  const IssuesEvent();

  @override
  List<Object> get props => [];
}

class GetAllIssuesEvent extends IssuesEvent {}

class GetAllAnswersForIssueEvent extends IssuesEvent {
  final String id;

  GetAllAnswersForIssueEvent({required this.id});

  @override
  List<Object> get props => [id];
}
