import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../../domain/entities/class.dart';
import '../../domain/usecase/create_class_usecase.dart';
import '../../domain/usecase/get_all_classes_usecase.dart';

part 'classes_event.dart';
part 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  final GetAllClassesUseCase getAllClassesUseCase;
  final CreateClassesUseCase createClassesUseCase;

  ClassesBloc({
    required this.createClassesUseCase,
    required this.getAllClassesUseCase,
  }) : super(ClassesInitial()) {
    on<GetAllClassesEvent>(_onGetAllClasses);
    on<CreateClassesEvent>(_onCreateClasses);
  }

  void _onGetAllClasses(
      GetAllClassesEvent event, Emitter<ClassesState> emit) async {
    emit(ClassesInitial());
    final failureOrIssues = await getAllClassesUseCase(NoParams());
    var classesState = _errorOrIssues(failureOrIssues);
    emit(classesState);
  }

  ClassesState _errorOrIssues(Either<Failure, List<Class>> failureOrIssues) {
    return failureOrIssues.fold(
      (failure) => const ClassesError(message: "Couldn't fetch classes"),
      (classes) => AllClasses(classes: classes),
    );
  }

  void _onCreateClasses(
      CreateClassesEvent event, Emitter<ClassesState> emit) async {
    emit(ClassesInitial());
    final failureOrClass =
        await createClassesUseCase(CreateClassParams(name: event.name));
    var classesState = _errorOrClass(failureOrClass);
    emit(classesState);
  }

  ClassesState _errorOrClass(Either<Failure, String> failureOrIssues) {
    return failureOrIssues.fold(
      (failure) => const ClassesError(message: "Couldn't create class"),
      (classes) => NewClasses(message: classes),
    );
  }
}
