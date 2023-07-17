import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/utils/secure_storage_keys.dart';
import '../model/user_auth_credential_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserAuthCredentialModel> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final http.Client client;
  final FlutterSecureStorage flutterSecureStorage;

  AuthenticationRemoteDataSourceImpl({
    required this.client,
    required this.flutterSecureStorage,
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

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final responseBodyData = responseBody['data'];
      final responseJson = {
        'email': responseBodyData['email'],
        'token': responseBody['token'],
        'userId': responseBodyData['_id'],
      };
      return UserAuthCredentialModel.fromJson(responseJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async {
    final userCredential =
        await flutterSecureStorage.read(key: authorizationKey);
    if (userCredential == null) {
      throw UnauthorizedRequestException();
    }

    final token = json.decode(userCredential)['token'];

    final response = await client.get(
      Uri.parse('$baseUrl/user/logout'),
      headers: {
        'authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return;
    }

    throw ServerException();
  }
}
