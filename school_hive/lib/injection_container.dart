import 'package:get_it/get_it.dart';
import 'package:school_hive/features/authentication/domain/domain.dart';
import 'package:school_hive/features/authentication/presentation/bloc/authentication_bloc.dart';

import 'features/authentication/data/repository/authentication_repository_impl.dart';

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

}
