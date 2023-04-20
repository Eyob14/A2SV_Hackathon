import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/secure_storage_keys.dart';
import '../models/class_model.dart';
import 'package:http/http.dart' as http;

abstract class ClassesRemoteDataSource {
  Future<List<ClassModel>> getAllClass();
  Future<String> createClass(String name);
}

class ClassesRemoteDataSourceImpl implements ClassesRemoteDataSource {
  final http.Client client;
  final FlutterSecureStorage flutterSecureStorage;

  ClassesRemoteDataSourceImpl({
    required this.client,
    required this.flutterSecureStorage,
  });
  @override
  Future<List<ClassModel>> getAllClass() async {
    try {
      final authCredential =
          await flutterSecureStorage.read(key: authorizationKey);
      if (authCredential == null) {
        throw UnauthorizedRequestException();
      }
      final authJson = json.decode(authCredential);
      // final token = authJson['token'];
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJlbWFpbCI6ImV5b2J6ZWJlbmUxMDU0QGdtYWlsLmNvbSIsInVzZXJOYW1lIjoiZXlvYjEyIiwibmFtZSI6IkV5b2IgWmViZW5lIiwicGFzc3dvcmQiOiIkMmIkMTAkSEZxSE05Mkw1bHlRN0QuTVp3WFVmT2NBbVlrRzA0cW5pWWRSSGQwV3N6UWk3NU5KWXlOT2EiLCJiaW8iOiJJIGFtIGEgZm91cnRoIHllYXIgc29mdHdhcmUgZW5naW5lZXJpbmcgc3R1ZGVudCBhdCBhZGRpcyBhYmFiYSB1bml2ZXJzaXR5IiwiZGVwYXJ0bWVudCI6IllvdXIgZGVwYXJ0bWVudCBnb2VzIGhlcmUuIiwieWVhciI6IllvdXIgeWVhciBnb2VzIGhlcmUuIiwiY291bnRyeSI6IkV0aGlvcGlhIiwiYXZhdGFyIjoiNjNmNzM1OTRiYTNjMDgxM2EyMThmZjJlIiwiZmF2b3JpdGVUYWdzIjpbXSwicmVzZXRUb2tlbiI6IiIsIl9pZCI6IjY0NDAwMjMwOTY3MjE2ZGE5N2YyMGNkYyIsImNyZWF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsInVwZGF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsIl9fdiI6MH0sImlhdCI6MTY4MTkxNjQ2NSwiZXhwIjoxNjg0NTA4NDY1fQ.HA_r6Ly_VYqV-QWwvIVhubLZ5XQ1mRuLWqP2JvuhBj0";

      var url = Uri.parse('$baseUrl/class/myClasses');

      final response = await client.get(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("response: ${response.body}");
      if (response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];
        print(body);
        return body.map((classData) => ClassModel.fromJson(classData)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> createClass(String name) async {
    print("Create class Function is called");
    try {
      final authCredential =
          await flutterSecureStorage.read(key: authorizationKey);
      if (authCredential == null) {
        throw UnauthorizedRequestException();
      }
      final authJson = json.decode(authCredential);
      // final token = authJson['token'];
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJlbWFpbCI6ImV5b2J6ZWJlbmUxMDU0QGdtYWlsLmNvbSIsInVzZXJOYW1lIjoiZXlvYjEyIiwibmFtZSI6IkV5b2IgWmViZW5lIiwicGFzc3dvcmQiOiIkMmIkMTAkSEZxSE05Mkw1bHlRN0QuTVp3WFVmT2NBbVlrRzA0cW5pWWRSSGQwV3N6UWk3NU5KWXlOT2EiLCJiaW8iOiJJIGFtIGEgZm91cnRoIHllYXIgc29mdHdhcmUgZW5naW5lZXJpbmcgc3R1ZGVudCBhdCBhZGRpcyBhYmFiYSB1bml2ZXJzaXR5IiwiZGVwYXJ0bWVudCI6IllvdXIgZGVwYXJ0bWVudCBnb2VzIGhlcmUuIiwieWVhciI6IllvdXIgeWVhciBnb2VzIGhlcmUuIiwiY291bnRyeSI6IkV0aGlvcGlhIiwiYXZhdGFyIjoiNjNmNzM1OTRiYTNjMDgxM2EyMThmZjJlIiwiZmF2b3JpdGVUYWdzIjpbXSwicmVzZXRUb2tlbiI6IiIsIl9pZCI6IjY0NDAwMjMwOTY3MjE2ZGE5N2YyMGNkYyIsImNyZWF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsInVwZGF0ZWRBdCI6IjIwMjMtMDQtMTlUMTU6MDE6MDQuNjUyWiIsIl9fdiI6MH0sImlhdCI6MTY4MTkxNjQ2NSwiZXhwIjoxNjg0NTA4NDY1fQ.HA_r6Ly_VYqV-QWwvIVhubLZ5XQ1mRuLWqP2JvuhBj0";

      var url = Uri.parse('$baseUrl/class/createClass');
      var request = http.MultipartRequest('POST', url);
      request.fields["name"] = name;

      Map<String, String> headers = {
        'authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      };

      request.headers.addAll(headers);
      final response = await request.send();
      var res = await http.Response.fromStream(response);

      print("The Create class function called api and returend");
      print("response: ${res.body}");
      if (res.statusCode == 201) {
        return "Class created successfully";
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("The Error was: $e");
      throw ServerException();
    }
  }
}
