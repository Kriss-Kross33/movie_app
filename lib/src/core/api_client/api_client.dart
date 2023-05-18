import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final headers = getHeaders();
    final fullPath = getFullPath(path, params);
    print('FULLPATH====> $fullPath');
    final uri = Uri.parse(fullPath);
    final response = await _client.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getFullPath(String path, Map<dynamic, dynamic>? params) {
    String paramString = '';
    if (params != null) {
      if (params.isNotEmpty) {
        params.forEach((key, value) {
          paramString += '&$key=$value';
        });
      }
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramString';
  }
}
