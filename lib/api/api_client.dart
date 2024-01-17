import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final String baseUrl = "http://localhost:3000";

  Future<Uint8List> getFileByPath(String fullPath) async {
    print(fullPath);
    print('$baseUrl/firebase/file?fullPath=$fullPath');
    final response = await http.get(
      Uri.parse('$baseUrl/firebase/file?fullPath=$fullPath'),
    );

    if (response.statusCode == 200) {
      final data =
          response.bodyBytes; // Use response.bodyBytes to get binary data
      return Uint8List.fromList(data);
    } else {
      throw Exception('Failed to retrieve file: ${response.body}');
    }
  }
}
