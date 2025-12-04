import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc_demo/domain/entities/user_entity.dart';
import 'package:users_bloc_demo/domain/use_cases/get_users_use_case.dart';

class UsersCubit extends Cubit<UserState> {
  final GetUsers getUsers;

  UsersCubit(this.getUsers) : super(UserInitial());

  Future<void> loadUsers() async {
    emit(UserLoading());
    try {
      final users = await getUsers();
      emit(UserCompleted(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserCompleted extends UserState {
  final List<UserEntity> users;

  UserCompleted(this.users);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
