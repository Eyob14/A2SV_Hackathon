import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:school_hive/core/error/error.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/secure_storage_keys.dart';
import '../../domain/entities/profile.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Profile> getProfileInfo();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final http.Client client;
  final FlutterSecureStorage flutterSecureStorage;

  ProfileRemoteDataSourceImpl({
    required this.client,
    required this.flutterSecureStorage,
  });

  @override
  Future<ProfileModel> getProfileInfo() async {
    try {
      final authCredential =
          await flutterSecureStorage.read(key: authorizationKey);
      if (authCredential == null) {
        throw UnauthorizedRequestException();
      }
      final authJson = json.decode(authCredential);
      final token = authJson['token'];
      // String token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJlbWFpbCI6ImV5b2J6ZWJlbmUxMDU0QGdtYWlsLmNvbSIsInVzZXJOYW1lIjoiZXlvYjEyIiwibmFtZSI6IkV5b2IgWmViZW5lIiwicGFzc3dvcmQiOiIkMmIkMTAkSEZxSE05Mkw1bHlRN0QuTVp3WFVmT2NBbVlrRzA0cW5pWWRSSGQwV3N6UWk3NU5KWXlOT2EiLCJiaW8iOiJJIGFtIGEgZm91cnRoIHllYXIgc29mdHdhcmUgZW5naW5lZXJpbmcgc3R1ZGVudCBhdCBhZGRpcyBhYmFiYSB1bml2ZXJzaXR5IiwiZGVwYXJ0bWVudCI6IllvdXIgZGVwYXJ0bWVudCBnb2VzIGhlcmUuIiwieWVhciI6IllvdXIgeWVhciBnb2VzIGhlcmUuIiwiY291bnRyeSI6IkV0aGlvcGlhIiwiYXZhdGFyIjoiNjNmNzM1OTRiYTNjMDgxM2EyMThmZjJlIiwiZmF2b3JpdGVUYWdzIjpbXSwicmVzZXRUb2tlbiI6IiIsIl9pZCI6IjY0NDAwMjMwOTY3MjE2ZGE5N2YyMGNkYyIsImNyZWF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsInVwZGF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsIl9fdiI6MH0sImlhdCI6MTY4MTkxNjQ2NSwiZXhwIjoxNjg0NTA4NDY1fQ.HA_r6Ly_VYqV-QWwvIVhubLZ5XQ1mRuLWqP2JvuhBj0";

      var url = Uri.parse('$baseUrl/user/currentUser');

      final response = await client.get(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(
            "********************************profile data retrived ${response.body}");
        ProfileModel profile =
            ProfileModel.fromJson(jsonDecode(response.body)["data"]);

        return profile;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("00000000000000000000000000000000000000000000 $e");
      throw ServerException();
    }
  }
}
