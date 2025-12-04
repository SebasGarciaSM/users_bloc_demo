import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:users_bloc_demo/core/exceptions.dart';
import 'package:http/http.dart' as http;

class HttpValidator {
  static dynamic validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 403:
        throw ForbiddenException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      default:
        throw AppException(response.statusCode.toString());
    }
  }

  static Future<http.Response> get(Uri url) async {
    try {
      final response = await http.get(url);
      return response;
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw NoInternetException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
