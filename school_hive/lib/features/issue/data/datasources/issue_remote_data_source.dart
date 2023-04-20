import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:school_hive/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:school_hive/features/authentication/domain/domain.dart';

import '../../../../core/error/exception.dart';
import '../models/issue_model.dart';

abstract class IssueRemoteDataSource {
  Future<IssueModel> addIssue({
    required String title,
    required String message,
    required List<File> archives,
  });
}

class IssueRemoteDataSourceImpl extends IssueRemoteDataSource {
  final http.Client client;

  final AuthenticationLocalDataSource authenticationLocalDataSource;

  IssueRemoteDataSourceImpl({
    required this.client,
    required this.authenticationLocalDataSource,
  });

  final baseUrl = 'https://school-hive-net.onrender.com/api/v1';

  @override
  Future<IssueModel> addIssue({
    required String title,
    required String message,
    required List<File> archives,
  }) async {
    final url = Uri.parse('$baseUrl/issue');

    try {
      final userAuthCredential =
          await authenticationLocalDataSource.getUserAuthCredential();

      // create multipart request for POST or PUT method
      final request = http.MultipartRequest('POST', url);

      request.fields['title'] = title;
      request.fields['description'] = message;
      request.fields['userId'] = userAuthCredential.userId;

      // add files to request
      for (var file in archives) {
        final fileStream = http.ByteStream(file.openRead());
        final fileLength = await file.length();
        final fileName = file.path.split('/').last;
        final multipartFile = http.MultipartFile(
            'archives', fileStream, fileLength,
            filename: fileName);
        request.files.add(multipartFile);
      }

      Map<String, String> headers = {
        'authorization': 'Bearer ${userAuthCredential.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      request.headers.addAll(headers);

      // send request
      final response = await request.send();
      final res = await http.Response.fromStream(response);

      // handle response
      if (res.statusCode == 201) {
        return IssueModel.fromJson(jsonDecode(res.body)['data']);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
