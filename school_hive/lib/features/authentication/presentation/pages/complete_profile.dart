import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/features/authentication/presentation/widgets/text_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/image_urls.dart';
import '../widgets/circle_avatar.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _fullNameController = TextEditingController();
  final _biographyController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _biographyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: 90.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 200,
                    child: Text(
                      'Complete Profile',
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  CustomTextButton(
                    onTap: () {},
                    buttonText: 'skip',
                  ),
                ],
              ),
              Row(
                children: [
                  const CustomCircleAvatar(),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Upload your photo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: darkGreyPrimary,
                        ),
                      ),
                      Text(
                        'will be displayed to other users',
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: greySecondary,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  TextField(
                    controller: _fullNameController,
                  ),
                ],
              ),
              Row(
                children: [
                  const ImageIcon(
                    AssetImage(graduation),
                  ),
                  TextField(
                    controller: _fullNameController,
                  ),
                ],
              ),
              TextField(
                controller: _fullNameController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
