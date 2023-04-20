import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_hive/features/profile/presentaion/pages/profile_page.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/image_urls.dart';
import '../../../classes/presentation/pages/classes_page.dart';
import '../../../classes/presentation/pages/events_page.dart';
import '../../../events/presentation/pages/events_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({super.key});

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  int index = 0;
  final screens = [
    const HomePage(),
    const EventPage(),
    const ClassesPage(),
    const FavoritePage(),
    ProfilePage(),
  ];
  GlobalKey globalKey = GlobalKey(debugLabel: 'bottom_bar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        key: globalKey,
        elevation: 3,
        selectedItemColor: primaryColor,
        selectedFontSize: 1.7.h,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeIcon,
              fit: BoxFit.scaleDown,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              eventIcon,
              fit: BoxFit.scaleDown,
            ),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              classIcon,
              fit: BoxFit.scaleDown,
            ),
            label: "Classes",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              favoriteIcon,
              fit: BoxFit.scaleDown,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              profileIcon,
              fit: BoxFit.scaleDown,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
