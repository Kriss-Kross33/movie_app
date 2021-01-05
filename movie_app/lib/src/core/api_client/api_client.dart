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

  dynamic get(String path) async {
    final headers = getHeaders();
    final response = await _client.get(
      '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}',
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      // print(responseBody);
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
