import 'dart:io';
import 'dart:math' as math;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/app_colors.dart';

import '../bloc/question_bloc.dart';
import '../widgets/file_item.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  List<PlatformFile> selectedFiles = [];
  List<File> files = [];

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        selectedFiles.addAll(result.files);
        files.addAll(result.paths.map((file) => File(file!)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Add Issue",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 2.2.h,
            color: headlineColor,
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
                        fileName: selectedFiles[index].name,
                        fileSize: selectedFiles[index].size,
                      );
                    },
                  ),
                ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.read<QuestionsBloc>().add(
                        AddQuestionEvent(
                          title: _titleController.text,
                          message: _messageController.text,
                          archives: files,
                        ),
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
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
