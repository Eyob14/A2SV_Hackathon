part of 'classes_bloc.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesInitial extends ClassesState {}

class AllClasses extends ClassesState {
  final List<Class> classes;

  const AllClasses({required this.classes});

  @override
  List<Object> get props => [classes];
}

class NewClasses extends ClassesState {
  final String message;

  const NewClasses({required this.message});

  @override
  List<Object> get props => [message];
}

class ClassesError extends ClassesState {
  final String message;

  const ClassesError({required this.message});

  @override
  List<Object> get props => [message];
}
