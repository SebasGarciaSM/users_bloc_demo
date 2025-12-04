import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc_demo/data/repositories_impl/users_repository_impl.dart';
import 'package:users_bloc_demo/domain/use_cases/get_users_use_case.dart';
import 'package:users_bloc_demo/presentation/cubit/counter_cubit.dart';
import 'package:users_bloc_demo/presentation/cubit/users_cubit.dart';
import 'package:users_bloc_demo/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(
            create: (BuildContext context) => CounterCubit(),
          ),
          BlocProvider<UsersCubit>(
            create: (BuildContext context) =>
                UsersCubit(GetUsers(UsersRepositoryImpl())),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
