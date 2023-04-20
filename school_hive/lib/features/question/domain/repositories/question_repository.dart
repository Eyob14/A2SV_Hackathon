import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/question.dart';

abstract class QuestionRepository {
  Future<Either<Failure, Question>> addQuestion({
    required String title,
    required String message,
    required List<File> archives,
  });
}
