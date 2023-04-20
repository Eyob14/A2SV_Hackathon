import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/authentication/presentation/widgets/default_button.dart';

import '../bloc/authentication_bloc.dart';
import '../widgets/text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _passwordVisibility = false;

  void changeVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthState &&
              state.status == Status.loaded &&
              state.authenticationStatus ==
                  AuthenticationStatus.authenticated) {
            // context.push(AppRoutes.homePage);
            context.push(AppRoutes.addIssuePage);
          } else if (state is AuthState && state.status == Status.failure) {
            // Todo: display error message
          }
        },
        child: Center(
          child: SizedBox(
            width: 85.w,
            child: Column(
              children: [
                SvgPicture.asset('assets/images/login.svg'),
                const Spacer(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.alternate_email,
                      color: greyPrimary,
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: Device.orientation == Orientation.portrait
                          ? 75.w
                          : 40.w,
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(fontFamily: 'Poppins'),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Email',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock_open,
                      color: greyPrimary,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: Device.orientation == Orientation.portrait
                          ? 75.w
                          : 40.w,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisibility,
                        obscuringCharacter: '*',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontFamily: 'Poppins'),
                          suffixIcon: _passwordVisibility
                              ? GestureDetector(
                                  onTap: () => changeVisibility(),
                                  child:
                                      const Icon(Icons.remove_red_eye_outlined),
                                )
                              : InkWell(
                                  onTap: () => changeVisibility(),
                                  child:
                                      const Icon(Icons.visibility_off_outlined),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    context.read<AuthenticationBloc>().add(
                          LoginEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                    context.go(AppRoutes.homePage);
                  },
                  buttonText: 'Login',
                  width: 85.w,
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New to school-hive?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    CustomTextButton(
                      onTap: () {
                        context.push(AppRoutes.signUpPage);
                      },
                      buttonText: 'Signup',
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
