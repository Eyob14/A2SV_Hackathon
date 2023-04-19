import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_hive/features/issue/domain/entities/Issue.dart';

import '../../../features/authentication/presentation/pages/login_page.dart';
import '../../../features/authentication/presentation/pages/sign_up_page.dart';
import '../../../features/issue/presentation/pages/details_page.dart';
import '../../../features/issue/presentation/pages/home_page.dart';
import '../../../features/profile/presentaion/pages/profile_page.dart';
import '../../utils/SecureStorage.dart';
import 'app_routes.dart';

class AppRouter extends StatelessWidget {
  // final AuthenticationLocalDataSource localDataSource;
  late final GoRouter _router;

  // FutureOr<String?> redirector(state) async {
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
  // }

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: AppRoutes.homePage,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoutes.loginPage,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: AppRoutes.signUpPage,
          builder: (BuildContext context, GoRouterState state) =>
              const SignUpPage(),
        ),
        GoRoute(
          path: AppRoutes.profilePage,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfilePage(),
        ),
        GoRoute(
          path: AppRoutes.homePage,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.detailsPage,
          builder: (BuildContext context, GoRouterState state) =>
              DetailsPage(issue: state.extra as Issue),
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
