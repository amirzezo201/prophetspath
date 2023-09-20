import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prophetspath/models/prayertime_model.dart';
import 'package:prophetspath/ui/screens/dua/dua.dart';
import 'package:prophetspath/ui/screens/explorebytopic/explore_topic.dart';
import 'package:prophetspath/ui/screens/prayer/prayertimeScreen.dart';
import 'package:prophetspath/ui/screens/quran/quran.dart';
import 'package:prophetspath/ui/screens/tasbih_counter/tasbih.dart';
import 'package:prophetspath/ui/screens/home_screen/home_screen.dart';
import 'package:prophetspath/utils/app_style.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidget();
}

class _NavigationBarWidget extends State<NavigationBarWidget> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const DuaMain(),
    const Quran(),
    const ExploreTopic(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            // style
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppStyle.primaryColor,
            backgroundColor: const Color(0xC4FEFEFE),
            showUnselectedLabels: false,
            unselectedItemColor: const Color(0xFF6F6F6F),
            //
            onTap: (int index) => setState(() => selectedIndex = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.home,
                    size: 25,
                  ),
                  activeIcon: Icon(
                    LineIcons.home,
                    size: 25,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.prayingHands,
                    size: 25,
                  ),
                  activeIcon: Icon(
                    LineIcons.prayingHands,
                    size: 25,
                  ),
                  label: 'Dua'),
              BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.quran,
                    size: 25,
                  ),
                  activeIcon: Icon(
                    LineIcons.quran,
                    size: 25,
                  ),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.search,
                    size: 25,
                  ),
                  activeIcon: Icon(
                    LineIcons.search,
                    size: 25,
                  ),
                  label: 'Explore'),
            ]),
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ));
  }
}
