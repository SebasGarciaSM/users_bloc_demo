import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:users_bloc_demo/core/network/http_validator.dart';
import 'package:users_bloc_demo/data/models/user.dart';
import 'package:users_bloc_demo/domain/entities/user_entity.dart';
import 'package:users_bloc_demo/domain/repositories/users_repository.dart';
import 'package:http/http.dart' as http;

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<List<UserEntity>> fetchUsers() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/users");

      final response = await http.get(url);
      HttpValidator.validateResponse(response);
      final List<dynamic> decodedJson = json.decode(response.body);
      final users = decodedJson
          .map((json) => User.fromJson(json).toEntity())
          .toList();
      return users;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
