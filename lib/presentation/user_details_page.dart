import 'package:flutter/material.dart';
import 'package:users_bloc_demo/domain/entities/user_entity.dart';

class UserDetailsPage extends StatelessWidget {
  final UserEntity user;

  const UserDetailsPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
