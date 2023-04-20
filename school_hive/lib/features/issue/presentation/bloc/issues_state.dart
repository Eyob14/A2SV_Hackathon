part of 'issues_bloc.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();

  @override
  List<Object> get props => [];
}

class IssuesInitial extends IssuesState {}

enum Status { loading, loaded, failure }

class AddIssueState extends IssuesState {
  final Status status;
  final Issue? issue;

  const AddIssueState({
    required this.status,
    this.issue,
  });

  @override
  List<Object> get props => [status];
}
