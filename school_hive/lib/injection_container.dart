import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:school_hive/features/issue/data/datasources/issue_remote_data_source.dart';
import 'package:school_hive/features/issue/data/repositories/issue_repository_impl.dart';
import 'package:school_hive/features/issue/domain/usecases/add_issue_usecase.dart';
import 'package:school_hive/features/issue/presentation/bloc/issues_bloc.dart';
import 'features/authentication/data/data.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';

import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/issue/domain/repositories/issue_repository.dart';

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
    () => AuthenticationRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(
      flutterSecureStorage: serviceLocator(),
    ),
  );

  //! Issue Feature
  // Bloc
  serviceLocator.registerFactory(
    () => IssuesBloc(addIssueUsecase: serviceLocator()),
  );
  // Usecase
  serviceLocator.registerLazySingleton(
    () => AddIssueUsecase(repository: serviceLocator()),
  );
  // Repository
  serviceLocator.registerLazySingleton<IssueRepository>(
    () => IssueRepositoryImpl(remoteDataSource: serviceLocator()),
  );
  // DataSource
  serviceLocator.registerLazySingleton<IssueRemoteDataSource>(
    () => IssueRemoteDataSourceImpl(
      client: serviceLocator(),
      authenticationLocalDataSource: serviceLocator(),
    ),
  );

  //! External
  const flutterSecureStorage = FlutterSecureStorage();

  serviceLocator.registerLazySingleton(() => flutterSecureStorage);
  serviceLocator.registerLazySingleton(() => http.Client());
}
