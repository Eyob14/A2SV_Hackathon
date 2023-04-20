import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/app_colors.dart';
import 'package:school_hive/core/utils/image_urls.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
    required this.fileName,
    required this.fileSize,
  });

  final String fileName;
  final int fileSize;

  String determineSize(int fileSize) {
    if (fileSize ~/ (1024 * 1024) > 0) {
      return '${fileSize ~/ (1024 * 1024)} MB';
    }
    return '${fileSize ~/ 1024} KB';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            color: lightBluePrimary,
            padding: const EdgeInsets.all(4),
            child: const ImageIcon(
              AssetImage(fileDoc),
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70.w,
                child: Text(
                  fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: determineSize(fileSize),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: darkGreyPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
