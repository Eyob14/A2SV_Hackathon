import 'package:flutter/material.dart';
import 'package:school_hive/core/utils/app_colors.dart';

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
      child: Container(
        color: purplePrimary,
        child: Text(buttonText),
      ),
    );
  }
}
