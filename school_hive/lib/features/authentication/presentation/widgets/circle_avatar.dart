import 'package:flutter/material.dart';
import 'package:school_hive/core/utils/app_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(85),
          child: Container(
            height: 85,
            width: 85,
            color: lightBluePrimary,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(4),
                color: purplePrimary,
                child: const Icon(
                  Icons.add,
                  color: whitePrimary,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
