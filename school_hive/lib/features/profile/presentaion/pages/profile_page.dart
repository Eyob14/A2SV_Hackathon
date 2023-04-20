import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/core/utils/image_urls.dart';

import '../../../../core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size_config.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileInfo());
  }

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _educationStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 2.2.h,
            color: headlineColor,
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print("profile page state ********************* $state");
          if (state is ProfileInfo) {
            return SingleChildScrollView(
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
                                child: state.profileInfo.avatar != ""
                                    ? Image.network(
                                        state.profileInfo.avatar,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        profileImage,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -16,
                            child: InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              borderRadius: BorderRadius.circular(100),
                              splashColor: Colors.pink[900],
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return EditProfilePage();
                                  },
                                ));
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
                        state.profileInfo.name,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      verticalSpacing(8),
                      Text(
                        state.profileInfo.bio,
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
                        child: Column(
                          children: [
                            SizedBox(
                              width: 320,
                              child: TextField(
                                controller: _emailController,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                decoration: InputDecoration(
                                  hintText: state.profileInfo.email,
                                  hintStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
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
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                decoration: InputDecoration(
                                  hintText: state.profileInfo.country,
                                  hintStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.flag_circle_outlined,
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
            );
          } else if (state is ProfileInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileError) {
            return Container(
              padding: EdgeInsets.only(top: 16.h),
              child: const Center(
                child: Text('No Results Found...'),
              ),
            );
          } else {
            return Container(
              child: Text("Some Error"),
            );
          }
        },
      ),
    );
  }
}
