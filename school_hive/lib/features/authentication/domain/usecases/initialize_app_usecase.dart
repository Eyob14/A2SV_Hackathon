import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class InitializeAppUsecase extends UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  InitializeAppUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.initializeApp();
  }
}
