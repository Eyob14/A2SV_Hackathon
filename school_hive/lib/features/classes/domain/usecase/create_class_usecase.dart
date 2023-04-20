import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/class.dart';
import '../repositories/class_repository.dart';

class CreateClassesUseCase implements UseCase<String, CreateClassParams> {
  final ClassesRepository classesRepository;

  CreateClassesUseCase({required this.classesRepository});

  @override
  Future<Either<Failure, String>> call(CreateClassParams params) async {
    return await classesRepository.createClass(params.name);
  }
}

class CreateClassParams extends Params {
  final String name;
  CreateClassParams({required this.name});
  @override
  List<Object?> get props => [name];
}
