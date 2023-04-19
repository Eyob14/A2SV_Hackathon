import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/authentication/data/data.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';

import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/issue/data/datasources/issue_remote_data_source.dart';
import 'features/issue/data/repositories/issue_repository_impl.dart';
import 'features/issue/domain/repositories/issue_repository.dart';
import 'features/issue/domain/usecases/get_all_issue_usecase.dart';
import 'features/issue/presentation/bloc/issues_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features
  //! Authentication Feature
  // Bloc
  serviceLocator.registerFactory(
    () => AuthenticationBloc(loginUsecase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => IssuesBloc(getAllIssuesUseCase: serviceLocator()),
  );

  // Usecase
  serviceLocator.registerLazySingleton(
    () => LoginUsecase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllIssuesUseCase(issuesRepository: serviceLocator()),
  );

  // Repository
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<IssuesRepository>(
    () => IssuesRepositoryImpl(
      remoteDataSource: serviceLocator(),
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

  serviceLocator.registerLazySingleton<IssuesRemoteDataSource>(
    () => IssuesRemoteDataSourceImpl(
      client: serviceLocator(),
      flutterSecureStorage: serviceLocator(),
    ),
  );

  //! External
  const flutterSecureStorage = FlutterSecureStorage();

  serviceLocator.registerLazySingleton(() => flutterSecureStorage);
  serviceLocator.registerLazySingleton(() => http.Client());
}
