import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/add_announcement_bottom_sheet.dart';
import '../widgets/add_event_bottom_sheet.dart';

class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        foregroundColor: headlineColor,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.add,
              size: 3.h,
              color: headlineColor,
            ),
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Label",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 300),
                context: context,
                pageBuilder: (context, anim1, anim2) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 8.h,
                      margin: EdgeInsets.only(
                        bottom: 4.2.h,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: AddEventBottomSheet(),
                                      ),
                                    );
                                  },
                                );

                                // context
                                // .read<GroupMembersBloc>()
                                // .add(NavigateToAddGroupPageEvent());
                                // Navigator.pop(context);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: Container(
                                  width: 33.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1.5.w),
                                    border: Border.all(
                                        color: primaryColor, width: 0.5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Event",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: headlineColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: AddAnnouncementBottomSheet(),
                                      ),
                                    );
                                  },
                                );

                                // context
                                //     .read<GroupMembersBloc>()
                                //     .add(NavigateToAddGroupMemberPageEvent());
                                // Navigator.pop(context);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: Container(
                                  width: 33.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1.5.w),
                                    border: Border.all(
                                        color: primaryColor, width: 0.5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Announcement",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: headlineColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                        .animate(anim1),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        child: Container(),
      ),
    );
  }
}
