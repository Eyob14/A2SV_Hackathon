import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_hive/features/classes/presentation/pages/class_detail_page.dart';
import '../../../features/authentication/data/datasources/authentication_local_data_source.dart';
import '../../../features/authentication/presentation/pages/complete_profile.dart';
import '../../../features/authentication/presentation/pages/login_page.dart';
import '../../../features/authentication/presentation/pages/signup_page.dart';
import '../../../features/classes/presentation/widgets/add_announcement_bottom_sheet.dart';
import '../../../features/classes/presentation/widgets/add_event_bottom_sheet.dart';
import '../../../features/question/presentation/pages/add_question.dart';
import '../../../features/issue/presentation/pages/home_page_navigator.dart';
import '../../../features/profile/presentaion/pages/edit_profile_page.dart';
import '../../../features/profile/presentaion/pages/profile_page.dart';
import 'app_routes.dart';

class AppRouter extends StatelessWidget {
  final AuthenticationLocalDataSource localDataSource;
  late final GoRouter _router;

  FutureOr<String?> redirector(state) async {
    // var isLoggedIn = true;
    // var isAppInitialized = true;
    // try {
    //   await localDataSource.getUserAuthCredential();
    // } on CacheException {
    //   isLoggedIn = false;
    // }
    // try {
    //   await localDataSource.getAppInitialization();
    // } on CacheException {
    //   isAppInitialized = false;
    // }

    // if (isLoggedIn) {
    //   if (state.location == AppRoutes.onboardingPages) {
    //     return AppRoutes.homePage;
    //   }
    //   return state.location;
    // } else if (isAppInitialized) {
    //   if (state.location == AppRoutes.onboardingPages) {
    //     return AppRoutes.loginPage;
    //   }
    //   return state.location;
    // } else {
    //   return null;
    // }
  }

  AppRouter({Key? key, required this.localDataSource})
      // AppRouter({Key? key, required this.authListenable, required this.authBloc})
      : super(key: key) {
    // authListenable.authStateProvider(authBloc);
    _router = GoRouter(
      // refreshListenable: authListenable,
      redirect: ((context, state) => redirector(state)),
      initialLocation: AppRoutes.loginPage,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoutes.loginPage,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: AppRoutes.signUpPage,
          builder: (BuildContext context, GoRouterState state) =>
              const SignupPage(),
        ),
        GoRoute(
          path: AppRoutes.completeProfilePage,
          builder: (BuildContext context, GoRouterState state) =>
              const CompleteProfilePage(),
        ),
        GoRoute(
          path: AppRoutes.profilePage,
          builder: (BuildContext context, GoRouterState state) => ProfilePage(),
        ),
        GoRoute(
          path: AppRoutes.editProfilePage,
          builder: (BuildContext context, GoRouterState state) =>
              EditProfilePage(),
        ),
        GoRoute(
          path: AppRoutes.homePage,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePageNavigator(),
        ),
        GoRoute(
          path: AppRoutes.addIssuePage,
          builder: (BuildContext context, GoRouterState state) =>
              const AddQuestion(),
        ),
        GoRoute(
          path: AppRoutes.addEventPage,
          builder: (BuildContext context, GoRouterState state) =>
              const AddEventBottomSheet(),
        ),
        GoRoute(
          path: AppRoutes.addAnnouncementPage,
          builder: (BuildContext context, GoRouterState state) =>
              const AddAnnouncementBottomSheet(),
        ),
        GoRoute(
          path: AppRoutes.classDetailsPage,
          builder: (BuildContext context, GoRouterState state) =>
              const ClassDetailsPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );
}
