import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/dummy/home_page_dummy.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/Issue.dart';
import '../../../profile/presentaion/widgets/profile_card.dart';
import '../commentsBloc/comments_bloc.dart';
import '../issueBloc/issues_bloc.dart';
import '../widgets/comment_card.dart';

class DetailsPage extends StatefulWidget {
  final Issue issue;
  const DetailsPage({super.key, required this.issue});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CommentsBloc>()
        .add(GetAllAnswersForIssueEvent(id: widget.issue.id));
  }

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
              widget.issue.title,
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
              avatar: widget.issue.profile.avatar,
              name: widget.issue.profile.name,
              time: widget.issue.profile.createdAt,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              widget.issue.description,
              style: TextStyle(
                color: bodyTextColor,
                fontSize: 1.5.h,
                height: 0.3.w,
              ),
            ),
            widget.issue.archives.isNotEmpty
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
            BlocBuilder<CommentsBloc, CommentsState>(
              builder: (context, state) {
                if (state is AllAnswersForIssues) {
                  print("All Answers for");
                  print(state);
                  return state.comments.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                    child: CommentCard(
                                      comment: state.comments[index],
                                      profileImage: widget.issue.profile.avatar,
                                      name: widget.issue.profile.name,
                                      time: widget.issue.profile.createdAt,
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
                              itemCount: state.comments.length),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Text(
                            "Be The First To Give Answer For The Issue",
                            style: TextStyle(
                                fontSize: 2.4.h, color: headlineColor),
                          ),
                        );
                } else if (state is CommentsInitial) {
                  return Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: const CircularProgressIndicator(),
                  );
                } else if (state is CommentError) {
                  return Container(
                    padding: EdgeInsets.only(top: 16.h),
                    child: const Center(
                      child: Text('No Results Found...'),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
