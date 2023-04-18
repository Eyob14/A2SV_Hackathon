import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key, required this.onTryAgain});
  final Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              'No Internet Connection Found',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Text(
              'Check your connection',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onTryAgain,
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
