import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class LogoutUsecase implements UseCase<NoReturns, NoParams> {
  final AuthenticationRepository repository;

  LogoutUsecase({required this.repository});

  @override
  Future<Either<Failure, NoReturns>> call(NoParams params) async {
    return await repository.logout();
  }
}
