import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'features/authentication/data/data.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';

import 'features/authentication/data/repository/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features
  //! Authentication Feature
  // Bloc
  serviceLocator.registerFactory(
    () => AuthenticationBloc(loginUsecase: serviceLocator()),
  );

  // Usecase
  serviceLocator.registerLazySingleton(
    () => LoginUsecase(repository: serviceLocator()),
  );

  // Repository
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );

  // DataSource
  serviceLocator.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(
      flutterSecureStorage: serviceLocator(),
    ),
  );

  //! External
  const flutterSecureStorage = FlutterSecureStorage();

  serviceLocator.registerLazySingleton(() => flutterSecureStorage);
}
