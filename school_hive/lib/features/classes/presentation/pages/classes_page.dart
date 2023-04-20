import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/presentation/routes/app_routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/classes_bloc.dart';
import '../widgets/create_class_bottomsheet.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ClassesBloc>().add(GetAllClassesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Classes",
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
          GestureDetector(
              child: Icon(
                Icons.add,
                size: 3.h,
                color: headlineColor,
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return CreateGroupSheet();
                  },
                );
              }),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: BlocBuilder<ClassesBloc, ClassesState>(
          builder: (context, state) {
            if (state is AllClasses) {
              return state.classes.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.classDetailsPage);
                        },
                        child: SizedBox(
                          height: 7.2.h,
                          child: Card(
                            child: Center(
                              child: Text(
                                state.classes[index].name,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 1.5.h,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                      itemCount: state.classes.length,
                    )
                  : Center(
                      child: Text(
                        "You don't have any class",
                        style: TextStyle(fontSize: 2.4.h, color: headlineColor),
                      ),
                    );
            } else if (state is ClassesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container(
                padding: EdgeInsets.only(top: 16.h),
                child: const Center(
                  child: Text('No Results Found...'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
