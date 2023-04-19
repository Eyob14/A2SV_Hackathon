import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/user_auth_credential.dart';
import '../repositories/authentication_repository.dart';

class GetUserAuthCredentialUsecase
    implements UseCase<UserAuthCredential, NoParams> {
  final AuthenticationRepository repository;

  GetUserAuthCredentialUsecase({required this.repository});

  @override
  Future<Either<Failure, UserAuthCredential>> call(NoParams params) async {
    return await repository.getUserAuthCredential();
  }
}
