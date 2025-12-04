import 'package:users_bloc_demo/domain/entities/user_entity.dart';
import 'package:users_bloc_demo/domain/repositories/users_repository.dart';

class GetUsers {
  final UsersRepository repository;

  GetUsers(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.fetchUsers();
  }
}
