import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final DateTime time;
  final String avatar;
  const ProfileCard(
      {super.key,
      required this.name,
      required this.time,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(avatar),
          radius: 6.w,
        ),
        SizedBox(
          width: 2.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 1.65.h,
                  fontFamily: "Poppins"),
            ),
            Text(
              time.toString(),
              style: TextStyle(
                  color: Color.fromRGBO(171, 171, 171, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 1.2.h,
                  fontFamily: "Poppins"),
            )
          ],
        ),
      ],
    );
    ;
  }
}
