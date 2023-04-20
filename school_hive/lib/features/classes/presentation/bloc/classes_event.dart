part of 'classes_bloc.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();

  @override
  List<Object> get props => [];
}

class GetAllClassesEvent extends ClassesEvent {}

class CreateClassesEvent extends ClassesEvent {
  final String name;

  CreateClassesEvent({required this.name});

  @override
  List<Object> get props => [name];
}
