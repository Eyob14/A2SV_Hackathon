import 'package:flutter/material.dart';
import 'package:school_hive/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final String buttonText;
  final VoidCallback onTap;

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
