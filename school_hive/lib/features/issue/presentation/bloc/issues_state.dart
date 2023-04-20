part of 'issues_bloc.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();  

  @override
  List<Object> get props => [];
}
class IssuesInitial extends IssuesState {}
