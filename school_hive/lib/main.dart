import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/presentation/routes/router_config.dart';
import 'core/presentation/widgets/dismiss_keyboard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Hive',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontFamilyFallback: [
          GoogleFonts.poppins().fontFamily!,
          GoogleFonts.montserrat().fontFamily!
        ],
        primarySwatch: Colors.blue,
      ),
      home: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SafeArea(
          child: DismissKeyboard(
            child: ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return AppRouter();
              },
            ),
          ),
        ),
      ),
    );
  }
}
