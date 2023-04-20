import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;

import '../../../../core/utils/app_colors.dart';
import '../../../question/presentation/widgets/file_item.dart';
import 'custom_text_field.dart';

class AddAnnouncementBottomSheet extends StatefulWidget {
  const AddAnnouncementBottomSheet({super.key});

  @override
  State<AddAnnouncementBottomSheet> createState() =>
      _AddAnnouncementBottomSheetState();
}

class _AddAnnouncementBottomSheetState
    extends State<AddAnnouncementBottomSheet> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  List<PlatformFile> files = [];

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        files.addAll(result.files);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          height: 90.h,
          width: 90.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Title ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: darkGreyPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: asteriskRedColor,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                textController: _titleController,
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  text: 'Message ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: darkGreyPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: asteriskRedColor,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                textController: _messageController,
                isMultiline: true,
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  text: 'Resources',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: darkGreyPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pickFile();
                },
                child: DottedBorder(
                  dashPattern: const [12, 8],
                  color: greyPrimary,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 72,
                      width: 360,
                      child: Center(
                        child: RichText(
                          text: const TextSpan(
                            text: 'Select file to ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: greyPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Upload',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: purplePrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (files.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  height: 30.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FileItem(
                        fileName: files[index].name,
                        fileSize: files[index].size,
                      );
                    },
                  ),
                ),
              const Spacer(),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: purplePrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Publish',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: whitePrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
