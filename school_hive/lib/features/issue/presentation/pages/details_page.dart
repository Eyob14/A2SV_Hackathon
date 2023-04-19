import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/Issue.dart';
import '../../../profile/presentaion/widgets/profile_card.dart';

class DetailsPage extends StatelessWidget {
  final Issue issue;
  const DetailsPage({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        foregroundColor: headlineColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        child: Column(
          children: [
            Text(
              issue.title,
              style: TextStyle(
                color: headlineColor,
                fontSize: 2.h,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2.2.h,
            ),
            ProfileCard(
              avatar: issue.profile.avatar,
              name: issue.profile.name,
              time: issue.profile.createdAt,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              issue.description,
              style: TextStyle(
                color: bodyTextColor,
                fontSize: 1.5.h,
                height: 0.3.w,
              ),
            ),
            issue.archives.isNotEmpty
                ? Text(
                    "Resources",
                    style: TextStyle(
                      color: headlineColor,
                      fontSize: 1.4.h,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(0.6.w),
                          padding: EdgeInsets.all(0.3.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            border:
                                Border.all(color: headlineColor, width: 0.2.w),
                          ),
                          child: Icon(Icons.arrow_upward_outlined, size: 4.w),
                        ),
                        Text(
                          "183",
                          style: TextStyle(
                            color: bodyTextColor,
                            fontSize: 1.5.h,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(0.6.w),
                          padding: EdgeInsets.all(0.3.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            border:
                                Border.all(color: headlineColor, width: 0.2.w),
                          ),
                          child: Icon(Icons.arrow_downward_outlined, size: 4.w),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            color: bodyTextColor,
                            fontSize: 1.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.messenger_outline),
                    Text(
                      "24 Comments",
                      style: TextStyle(
                        color: bodyTextColor,
                        fontSize: 1.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
