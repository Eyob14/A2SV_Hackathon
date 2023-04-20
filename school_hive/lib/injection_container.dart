import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:school_hive/features/question/data/datasources/question_remote_data_source.dart';
import 'package:school_hive/features/question/data/repositories/question_repository_impl.dart';
import 'package:school_hive/features/question/domain/usecases/add_question_usecase.dart';
import 'features/authentication/data/data.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';

import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/question/domain/repositories/question_repository.dart';
import 'features/question/presentation/bloc/question_bloc.dart';

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

  //! Question Feature
  // Bloc
  serviceLocator.registerFactory(
    () => QuestionsBloc(addQuestionUsecase: serviceLocator()),
  );
  // Usecase
  serviceLocator.registerLazySingleton(
    () => AddQuestionUsecase(repository: serviceLocator()),
  );
  // Repository
  serviceLocator.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(remoteDataSource: serviceLocator()),
  );
  // DataSource
  serviceLocator.registerLazySingleton<QuestionRemoteDataSource>(
    () => QuestionRemoteDataSourceImpl(
      client: serviceLocator(),
      authenticationLocalDataSource: serviceLocator(),
    ),
  );

  //! External
  const flutterSecureStorage = FlutterSecureStorage();

  serviceLocator.registerLazySingleton(() => flutterSecureStorage);
  serviceLocator.registerLazySingleton(() => http.Client());
}
