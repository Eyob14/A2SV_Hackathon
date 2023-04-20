import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/image_urls.dart';
import '../../../../core/utils/size_config.dart';

import '../widgets/calendar_section.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 46,
        backgroundColor: Colors.transparent,
        elevation: 0,
        primary: true,
        title: Align(
          alignment: FractionalOffset.centerLeft,
          child: Text(
            'Events',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              searchIcon,
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              plusIcon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacing(20),
                Expanded(
                  child: CalenderSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
