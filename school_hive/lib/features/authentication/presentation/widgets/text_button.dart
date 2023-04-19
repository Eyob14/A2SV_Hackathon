import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: purplePrimary,
          fontSize: 16,
        ),
      ),
    );
  }
}
