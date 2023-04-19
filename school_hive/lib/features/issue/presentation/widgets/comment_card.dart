import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/image_urls.dart';
import 'package:school_hive/features/issue/domain/entities/comment.dart';
import 'package:school_hive/features/profile/presentaion/widgets/profile_card.dart';

import '../../../../core/utils/app_colors.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;

  const CommentCard({super.key, required this.comment});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          name: "Eyob Zebene",
          time: DateTime.now(),
          avatar: profileImage,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 1.4.h,
          ),
          child: Column(
            children: [
              Text(
                widget.comment.description,
                style: TextStyle(
                  color: bodyTextColor,
                  fontSize: 1.3.h,
                ),
              ),
              Divider(
                thickness: 0.2.w,
              ),
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
                              border: Border.all(
                                  color: headlineColor, width: 0.2.w),
                            ),
                            child: Icon(Icons.arrow_upward_outlined, size: 4.w),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.comment.upVotes.toString(),
                            style: TextStyle(
                              color: bodyTextColor,
                              fontSize: 1.5.h,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(0.6.w),
                            padding: EdgeInsets.all(0.3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: headlineColor, width: 0.2.w),
                            ),
                            child:
                                Icon(Icons.arrow_downward_outlined, size: 4.w),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.comment.downVotes.toString(),
                            style: TextStyle(
                              color: bodyTextColor,
                              fontSize: 1.5.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.messenger_outline),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "Reply",
                        style: TextStyle(
                          color: bodyTextColor,
                          fontSize: 1.4.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
