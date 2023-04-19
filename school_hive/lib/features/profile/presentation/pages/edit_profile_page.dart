import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size_config.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String educationStatus = 'Student';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 46,
        backgroundColor: Colors.transparent,
        elevation: 0,
        primary: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacing(30),
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    DottedBorder(
                      color: primaryColor,
                      borderType: BorderType.RRect,
                      padding: const EdgeInsets.all(6),
                      radius: const Radius.circular(100),
                      dashPattern: const [14, 16],
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink.withOpacity(.04),
                          ),
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -16,
                      child: InkWell(
                        overlayColor: MaterialStateProperty.all(Colors.white),
                        borderRadius: BorderRadius.circular(100),
                        splashColor: Colors.pink[900],
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0C1935),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.photo_camera_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpacing(30),
                Text(
                  'Lidia Daniel',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                verticalSpacing(32),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/user profile.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      verticalSpacing(12),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: const Icon(Icons.alternate_email),
                          ),
                        ),
                      ),
                      verticalSpacing(12),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/phone device.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      verticalSpacing(12),
                      SizedBox(
                        width: 320,
                        child: DropdownButtonFormField(
                          value: educationStatus,
                          items: <String>[
                            'Student',
                            'Graduated',
                          ]
                              .map<DropdownMenuItem<String>>(
                                  (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                        ),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            educationStatus = value!;
                          },
                          decoration: InputDecoration(
                            hintText: 'Education status',
                            hintStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/graduation-hat.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacing(40),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.update,
                            color: Colors.white,
                          ),
                          horizontalSpacing(8),
                          Text(
                            'Update',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
