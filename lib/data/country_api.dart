import 'dart:convert';
// ignore: duplicate_import
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/entities/country.dart';

class CountryApi {
  static Future getCountries(String bearerToken) async {
    // Create headers with the bearer token
    Map<String, String> headers = {
      'Authorization': 'Bearer $bearerToken',
      'Content-Type':
          'application/json', // Adjust this based on your API requirements
    };

    // Make the HTTP request with the headers
    final response = await http.get(
      Uri.parse("http://localhost:80/api/services/countries"),
      headers: headers,
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse and return the response data
      final List<dynamic> countriesJson =
          json.decode(response.body)['_embedded']['countries'];
      return countriesJson.map((json) => Country.fromJson(json)).toList();
    } else {
      // If the request was not successful, throw an exception or handle the error accordingly
      throw Exception('Failed to load countries');
    }
  }
}
