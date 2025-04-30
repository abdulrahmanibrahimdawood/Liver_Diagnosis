import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll(
          {
            'Authorization': 'Bearer $token',
          },
        );
      }
      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception(
          'No internet connection. Please check your connection and try again.');
    } catch (e) {
      throw Exception('Failed to load data. Please try again later.');
    }
  }
}
