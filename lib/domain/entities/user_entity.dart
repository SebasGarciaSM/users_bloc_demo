import 'package:users_bloc_demo/domain/entities/address_entity.dart';

class UserEntity {
  int id;
  String name;
  String username;
  String email;
  AddressEntity address;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });
}
