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
import 'features/classes/data/datasource/remote_class_data_source.dart';
import 'features/classes/data/repositories/class_repository_impl.dart';
import 'features/classes/domain/repositories/class_repository.dart';
import 'features/classes/domain/usecase/create_class_usecase.dart';
import 'features/classes/domain/usecase/get_all_classes_usecase.dart';
import 'features/classes/presentation/bloc/classes_bloc.dart';
import 'features/issue/data/datasources/issue_remote_data_source.dart';
import 'features/issue/data/repositories/issue_repository_impl.dart';
import 'features/issue/domain/repositories/issue_repository.dart';
import 'features/issue/domain/usecases/get_all_answers_for_issue.dart';
import 'features/issue/domain/usecases/get_all_issue_usecase.dart';
import 'features/issue/presentation/commentsBloc/comments_bloc.dart';
import 'features/issue/presentation/issueBloc/issues_bloc.dart';
import 'features/profile/data/datasource/profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repo_init.dart';
import 'features/profile/domain/repository/profile_repo.dart';
import 'features/profile/domain/usecases/get_profile_info_usecase.dart';
import 'features/profile/presentaion/bloc/profile_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features
  //! Authentication Feature
  // Bloc
  serviceLocator.registerFactory(
    () => AuthenticationBloc(loginUsecase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => IssuesBloc(
      getAllIssuesUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProfileBloc(
      profileInfoUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CommentsBloc(
      getAllAnswersForIssuesUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ClassesBloc(
        getAllClassesUseCase: serviceLocator(),
        createClassesUseCase: serviceLocator()),
  );

  // Usecase
  serviceLocator.registerLazySingleton(
    () => LoginUsecase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllIssuesUseCase(issuesRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllAnswersForIssueUseCase(
      issuesRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllClassesUseCase(classesRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => CreateClassesUseCase(classesRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetProfileInfoUseCase(profileRepository: serviceLocator()),
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
  serviceLocator.registerLazySingleton<ClassesRepository>(
    () => ClassesRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
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

  serviceLocator.registerLazySingleton<IssuesRemoteDataSource>(
    () => IssuesRemoteDataSourceImpl(
      client: serviceLocator(),
      flutterSecureStorage: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ClassesRemoteDataSource>(
    () => ClassesRemoteDataSourceImpl(
      client: serviceLocator(),
      flutterSecureStorage: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      client: serviceLocator(),
      flutterSecureStorage: serviceLocator(),
    ),
  );

  //! External
  const flutterSecureStorage = FlutterSecureStorage();

  serviceLocator.registerLazySingleton(() => flutterSecureStorage);
  serviceLocator.registerLazySingleton(() => http.Client());
}
