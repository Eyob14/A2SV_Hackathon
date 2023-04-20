import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/class.dart';

abstract class ClassesRepository {
  Future<Either<Failure, List<Class>>> getAllClasses();
  Future<Either<Failure, String>> createClass(String name);
}
