import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.width,
  });

  final String buttonText;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        decoration: BoxDecoration(
          color: purplePrimary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
