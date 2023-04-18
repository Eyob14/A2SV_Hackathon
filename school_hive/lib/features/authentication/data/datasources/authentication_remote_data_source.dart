import '../../../../core/presentation/usecases/usecase.dart';
import '../model/user_auth_credential_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserAuthCredentialModel> login({
    required String email,
    required String password,
  });
  Future<NoReturns> logout();
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  @override
  Future<UserAuthCredentialModel> login(
      {required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<NoReturns> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
