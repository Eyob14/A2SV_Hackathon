import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/app_colors.dart';

import '../../../../core/dummy/home_page_dummy.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../widgets/issue_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "School-Hive",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 2.2.h,
            color: headlineColor,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 3.h,
            color: headlineColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            Icons.notifications_active_outlined,
            size: 3.h,
            color: headlineColor,
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "For You",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 1.5.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Resources",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 1.5.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Scholarships",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 1.5.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Campus Life",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 1.5.h,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 2.2.h),
                child: ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                          child: IssueCard(
                            issue: issueList[index % 3],
                          ),
                          onTap: () {
                            context.push(
                              AppRoutes.detailsPage,
                              extra: issueList[index % 3],
                            );
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.5.h,
                        ),
                    itemCount: issueList.length * 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
