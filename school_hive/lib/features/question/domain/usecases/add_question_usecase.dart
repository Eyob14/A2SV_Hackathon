import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/question.dart';
import '../repositories/question_repository.dart';

class AddQuestionUsecase implements UseCase<Question, AddQuestionParams> {
  final QuestionRepository repository;

  AddQuestionUsecase({required this.repository});

  @override
  Future<Either<Failure, Question>> call(AddQuestionParams params) async {
    return await repository.addQuestion(
      title: params.title,
      message: params.message,
      archives: params.archives,
    );
  }
}

class AddQuestionParams extends Equatable {
  final String title;
  final String message;
  final List<File> archives;

  const AddQuestionParams({
    required this.title,
    required this.message,
    required this.archives,
  });

  @override
  List<Object?> get props => [title, message, archives];
}
