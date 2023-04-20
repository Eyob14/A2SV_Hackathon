import 'dart:math' as math;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/app_colors.dart';
import 'package:school_hive/features/issue/widgets/file_item.dart';

class AddIssue extends StatefulWidget {
  const AddIssue({super.key});

  @override
  State<AddIssue> createState() => _AddIssueState();
}

class _AddIssueState extends State<AddIssue> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        primary: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add Issue',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: darkGreyPrimary,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
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
              SizedBox(
                width: 90.w,
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: backgroundTextField,
                    filled: true,
                  ),
                ),
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
              SizedBox(
                width: 90.w,
                child: TextField(
                  controller: _messageController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: backgroundTextField,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  text: 'Upload resources',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: darkGreyPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 6),
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
                  padding: const EdgeInsets.all(10),
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: purplePrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: -math.pi / 4,
                        child: const Icon(
                          Icons.send_rounded,
                          color: whitePrimary,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: whitePrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
