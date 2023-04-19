import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size_config.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _educationStatusController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
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
                        onTap: () {
                          print('here we go');
                        },
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
                                Icons.edit,
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
                verticalSpacing(8),
                Text(
                  '5th year student\nLove working on UI/UX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
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
                          controller: _emailController,
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
                        child: TextField(
                          controller: _educationStatusController,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
