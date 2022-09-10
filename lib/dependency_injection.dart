import 'package:get_it/get_it.dart';
import 'package:msg/modules/auth/data/datasource/abstract_remote_datasource.dart';
import 'package:msg/modules/auth/data/datasource/remote_datasource.dart';
import 'package:msg/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:msg/modules/auth/domain/repository/auth_repository.dart';
import 'package:msg/modules/auth/domain/usecase/login.dart';
import 'package:msg/modules/auth/domain/usecase/logout.dart';
import 'package:msg/modules/auth/domain/usecase/register.dart';
import 'package:msg/modules/auth/domain/usecase/user_check.dart';
import 'package:msg/modules/auth/presentation/auth_cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => Login(repo: sl()));
  sl.registerLazySingleton(() => Register(repo: sl()));
  sl.registerLazySingleton(() => Logout(repo: sl()));
  sl.registerLazySingleton(() => UserCheck(repo: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
