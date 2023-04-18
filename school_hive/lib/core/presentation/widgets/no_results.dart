import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/image_urls.dart';

class NoResults extends StatelessWidget {
  final Function()? actionButton;
  const NoResults({
    super.key,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 22.w,
                  height: 11.h,
                  child: Image.asset(noResults),
                ),
                Text(
                  'Looks Like We could not get any match!',
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Care to Search again',
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: actionButton,
                  child: const Text(
                    "Search again",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
