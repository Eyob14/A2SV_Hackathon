import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    this.isMultiline = false,
  });

  final textController;
  final isMultiline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: TextField(
        controller: textController,
        keyboardType:
            isMultiline ? TextInputType.multiline : TextInputType.text,
        maxLines: isMultiline ? null : 1,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          fillColor: backgroundTextField,
          filled: true,
        ),
      ),
    );
  }
}
