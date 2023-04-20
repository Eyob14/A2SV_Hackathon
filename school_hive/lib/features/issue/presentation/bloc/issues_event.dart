part of 'issues_bloc.dart';

abstract class IssuesEvent extends Equatable {
  const IssuesEvent();

  @override
  List<Object> get props => [];
}

class AddIssueEvent extends IssuesEvent {
  final String title;
  final String message;
  final List<File> archives;

  const AddIssueEvent({
    required this.title,
    required this.message,
    required this.archives,
  });

  @override
  List<Object> get props => [title, message, archives];
}
