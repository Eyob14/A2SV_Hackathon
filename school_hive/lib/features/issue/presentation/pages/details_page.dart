import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/dummy/home_page_dummy.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/Issue.dart';
import '../../../profile/presentaion/widgets/profile_card.dart';
import '../widgets/comment_card.dart';

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
            SizedBox(
              height: 1.h,
            ),
            Divider(
              thickness: 0.2.w,
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        child: CommentCard(
                          comment: comments[index % 3],
                        ),
                        onTap: () {
                          context.push(
                            AppRoutes.detailsPage,
                          );
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.8.h,
                      ),
                  itemCount: comments.length * 2),
            ),
          ],
        ),
      ),
    );
  }
}
