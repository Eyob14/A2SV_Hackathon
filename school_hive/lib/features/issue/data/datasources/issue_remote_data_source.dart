import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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

  IssueRemoteDataSourceImpl({
    required this.client,
  });

  final baseUrl = 'https://school-hive-net.onrender.com/api/v1';

  @override
  Future<IssueModel> addIssue({
    required String title,
    required String message,
    required List<File> archives,
  }) async {
    final url = Uri.parse('$baseUrl/issue');

    // create multipart request for POST or PUT method
    final request = http.MultipartRequest('POST', url);

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

    // send request
    final response = await request.send();
    final res = await http.Response.fromStream(response);

    // handle response
    if (res.statusCode == 200) {
      return IssueModel.fromJson(jsonDecode(res.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
