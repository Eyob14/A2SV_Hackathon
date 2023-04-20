import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Favorites",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 2.2.h,
            color: headlineColor,
          ),
        ),
      ),
      body: Center(
          child: Text(
        "Coming Soon ...",
        style: TextStyle(fontSize: 2.4.h, color: headlineColor),
      )),
    );
  }
}
