import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_hive/features/profile/presentaion/pages/profile_page.dart';

import '../../../classes/presentation/pages/classes_page.dart';
import '../../../classes/presentation/pages/events_page.dart';
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
    const EventsPage(),
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
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/phone device.svg',
              fit: BoxFit.scaleDown,
            ),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Classes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Profile",
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
