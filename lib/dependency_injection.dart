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
import 'package:msg/modules/image/data/datasource/image_remote_datasource.dart';
import 'package:msg/modules/image/data/repository/image_repository_Impl.dart';
import 'package:msg/modules/image/domain/usecase/get_download_url.dart';
import 'package:msg/modules/image/domain/usecase/upload_image_to_storage.dart';
import 'package:msg/modules/image/presentation/cubits/storage/storage_cubit.dart';

import 'modules/image/data/datasource/remote_data_source.dart';
import 'modules/image/domain/repository/image_repository.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => StorageCubit(sl(), sl()));

  sl.registerLazySingleton(() => Login(repo: sl()));
  sl.registerLazySingleton(() => Register(repo: sl()));
  sl.registerLazySingleton(() => Logout(repo: sl()));
  sl.registerLazySingleton(() => UserCheck(repo: sl()));
  sl.registerLazySingleton(() => GetDownloadUrl(repo: sl()));
  sl.registerLazySingleton(() => UploadImageToStorage(repo: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: sl(),
    ),
  );
  sl.registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(imageRemote: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<ImageRemoteDataSource>(
      () => ImageRemoteDataSourceImpl());
}
