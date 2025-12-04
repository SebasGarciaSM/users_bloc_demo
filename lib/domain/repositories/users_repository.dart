import 'package:users_bloc_demo/domain/entities/user_entity.dart';

abstract class UsersRepository {
  Future<List<UserEntity>> fetchUsers();
}
