import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/class.dart';
import '../repositories/class_repository.dart';

class GetAllClassesUseCase implements UseCase<List<Class>, NoParams> {
  final ClassesRepository classesRepository;

  GetAllClassesUseCase({required this.classesRepository});

  @override
  Future<Either<Failure, List<Class>>> call(NoParams params) async {
    return await classesRepository.getAllClasses();
  }
}
