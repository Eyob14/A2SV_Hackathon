import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/utils/secure_storage_keys.dart';
import '../model/user_auth_credential_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<UserAuthCredentialModel> getUserAuthCredential();
  Future<void> cacheUserAuthCredential(
      {required UserAuthCredentialModel userAuthCredentialModel});
  Future<void> clearUserAuthCredentialCache();
  Future<void> initializeApp();
  Future<bool> getAppInitialization();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  AuthenticationLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<void> cacheUserAuthCredential(
      {required UserAuthCredentialModel userAuthCredentialModel}) {
    return flutterSecureStorage.write(
        key: authorizationKey, value: json.encode(userAuthCredentialModel));
  }

  @override
  Future<void> clearUserAuthCredentialCache() async {
    return await flutterSecureStorage.delete(key: authorizationKey);
  }

  @override
  Future<UserAuthCredentialModel> getUserAuthCredential() async {
    final authorizationToken =
        await flutterSecureStorage.read(key: authorizationKey);
    if (authorizationToken != null) {
      return Future.value(
          UserAuthCredentialModel.fromJson(json.decode(authorizationToken)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> getAppInitialization() async {
    final initialized = await flutterSecureStorage.read(key: initializationKey);
    if (initialized != null) {
      return true;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> initializeApp() async {
    return flutterSecureStorage.write(key: initializationKey, value: 'true');
  }
}
