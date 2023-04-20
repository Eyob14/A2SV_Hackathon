import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/app_colors.dart';

import '../../../../core/dummy/home_page_dummy.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../issueBloc/issues_bloc.dart';
import '../widgets/issue_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<IssuesBloc>().add(GetAllIssuesEvent());
  }

  int selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    const tags = ["For You", "Resources", "Scholarships", "Campus Life"];

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
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTag = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        tags[index],
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 1.5.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      selectedTag == index
                          ? Container(
                              height: 0.44.w,
                              width: 3.5.w,
                              color: primaryColor,
                            )
                          : Container()
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 7.w,
                ),
                itemCount: tags.length,
              ),
            ),
            BlocBuilder<IssuesBloc, IssuesState>(
              builder: (context, state) {
                if (state is AllIssues) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              child: IssueCard(
                                issue: state.issues[index],
                              ),
                              onTap: () {
                                context.push(
                                  AppRoutes.detailsPage,
                                  extra: state.issues[index],
                                );
                              },
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.5.h,
                            ),
                        itemCount: state.issues.length),
                  );
                } else if (state is IssuesInitial) {
                  return Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: const CircularProgressIndicator(),
                  );
                } else if (state is IssuesError) {
                  return Container(
                    padding: EdgeInsets.only(top: 16.h),
                    child: const Center(
                      child: Text('No Results Found...'),
                    ),
                  );
                } else {
                  context.read<IssuesBloc>().add(GetAllIssuesEvent());
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          context.push(AppRoutes.addIssuePage);
        },
        tooltip: 'Create Issue',
        child: const Icon(Icons.add),
      ),
    );
  }
}
