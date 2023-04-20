import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
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
  final http.Client client;

  AuthenticationRemoteDataSourceImpl({
    required this.client,
  });

  final baseUrl = 'https://school-hive-net.onrender.com/api/v1';

  @override
  Future<UserAuthCredentialModel> login({
    required String email,
    required String password,
  }) async {
    final loginBody = json.encode({
      'email': email,
      'password': password,
    });
    final response = await client.post(
      Uri.parse('$baseUrl/user/login'),
      body: loginBody,
      headers: {'Content-Type': 'application/json'},
    );
    print(loginBody);
    print(response.statusCode);
    print(response.body);
    print(response.headers);
    print(response.headers.keys);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final responseBodyData = responseBody['data'];
      final responseJson = {
        'email': responseBodyData['email'],
        'token': responseBody['token'],
      };
      return UserAuthCredentialModel.fromJson(responseJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NoReturns> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
