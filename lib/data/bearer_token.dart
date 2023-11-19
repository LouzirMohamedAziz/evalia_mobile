import 'dart:convert';

import 'package:http/http.dart' as http;

class BearerToken {
  static Future<String> getBearerToken() async {
    try {
      String credentials =
          base64Encode(utf8.encode('evalia_admin:evalia@2023'));

      Map<String, String> headers = {
        'Authorization': 'Basic $credentials',
      };

      final response = await http.post(
        Uri.parse("http://localhost:80/api/auth/administrator/signin"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      print('Error: $e');
      return "";
    }
  }
}
