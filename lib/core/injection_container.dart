import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:users_bloc_demo/data/repositories_impl/users_repository_impl.dart';
import 'package:users_bloc_demo/domain/use_cases/get_users_use_case.dart';
import 'package:users_bloc_demo/presentation/cubit/users_cubit.dart';

final sl = GetIt.asNewInstance();

Future<void> setupLocator() async {
  // Here you can register your dependencies, for example:
  // sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl());
  // sl.registerFactory(() => GetUsers(sl<UsersRepository>()));

  // EXTERNAL
  sl.registerLazySingleton(() => http.Client());

  // DATA
  sl.registerLazySingleton(() => UsersRepositoryImpl(sl<http.Client>()));

  // DOMAIN
  sl.registerLazySingleton(() => GetUsers(sl<UsersRepositoryImpl>()));

  // PRESENTATION
  sl.registerFactory(() => UsersCubit(sl<GetUsers>()));
}
