import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_hive/features/authentication/presentation/widgets/default_button.dart';

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/images/login.svg'),
        const Text('Login'),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
          ),
        ),
        TextField(
          controller: _passwordController,
          obscureText: !_passwordVisibility,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_open),
            suffixIcon: _passwordVisibility
                ? InkWell(
                    onTap: () => changeVisibility(),
                    child: const Icon(Icons.remove_red_eye_outlined),
                  )
                : InkWell(
                    onTap: () => changeVisibility(),
                    child: const Icon(Icons.visibility_off_outlined),
                  ),
          ),
        ),
        CustomButton(
          onTap: () {},
          buttonText: 'Login',
        ),
        CustomTextButton(
          onTap: () {},
          buttonText: 'Forgot Password?',
        )
      ],
    );
  }
}
