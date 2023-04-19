import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/image_urls.dart';
import '../../domain/entities/Issue.dart';
import '../../../profile/presentaion/widgets/profile_card.dart';

class IssueCard extends StatelessWidget {
  final Issue issue;

  const IssueCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileCard(
          avatar: issue.profile.avatar,
          name: issue.profile.name,
          time: issue.profile.createdAt,
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          issue.title,
          style: TextStyle(
            color: headlineColor,
            fontSize: 1.7.h,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          issue.description,
          style: TextStyle(color: bodyTextColor, fontSize: 1.3.h),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          "Read More",
          style: TextStyle(
            color: headlineColor,
            fontSize: 1.4.h,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
