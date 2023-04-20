import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'core/presentation/routes/router_config.dart';
import 'core/presentation/widgets/dismiss_keyboard.dart';
import 'features/authentication/data/datasources/authentication_local_data_source.dart';
import 'features/question/presentation/bloc/question_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => serviceLocator<AuthenticationBloc>(),
        ),
        BlocProvider<QuestionsBloc>(
          create: (_) => serviceLocator<QuestionsBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SafeArea(
          child: DismissKeyboard(
            child: ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return AppRouter(
                  localDataSource:
                      serviceLocator<AuthenticationLocalDataSource>(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
