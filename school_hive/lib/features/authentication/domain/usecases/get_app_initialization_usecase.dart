import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class GetAppInitializationUsecase extends UseCase<bool, NoParams> {
  final AuthenticationRepository repository;

  GetAppInitializationUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getAppInitialization();
  }
}
