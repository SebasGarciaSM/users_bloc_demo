import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:users_bloc_demo/core/injection_container.dart';
import 'package:users_bloc_demo/presentation/cubit/users_cubit.dart';
import 'package:users_bloc_demo/presentation/home_page.dart';
import 'package:users_bloc_demo/presentation/user_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<UsersCubit>()..loadUsers(),
            child: HomePage(),
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: _router,

      // home: BlocProvider(
      //   create: (_) => sl<UsersCubit>()..loadUsers(),
      //   child: const UserDetailsPage(),
      // ),
    );
  }
}
