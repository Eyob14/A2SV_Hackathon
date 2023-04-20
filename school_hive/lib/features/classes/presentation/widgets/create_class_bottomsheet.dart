import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/presentation/routes/app_routes.dart';

import '../../../authentication/presentation/widgets/default_button.dart';
import '../bloc/classes_bloc.dart';

class CreateGroupSheet extends StatelessWidget {
  const CreateGroupSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _classNameController = TextEditingController();
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      constraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: 15.w,
                child: Divider(
                  color: Colors.black12,
                  thickness: (0.8).h,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Class',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Flexible(
            child: TextField(
              controller: _classNameController,
              style: const TextStyle(fontFamily: 'Poppins'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Class Name',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                buttonText: 'Create',
                onTap: () {
                  context.read<ClassesBloc>().add(
                        CreateClassesEvent(
                          name: _classNameController.text,
                        ),
                      );
                  Navigator.pop(context);
                },
                width: 75.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
