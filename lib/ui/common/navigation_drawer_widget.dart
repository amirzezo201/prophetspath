import 'package:flutter/material.dart';
import 'package:prophetspath/ui/screens/about/app_about.dart';
import 'package:prophetspath/ui/screens/feedback/feedback.dart';
import 'package:prophetspath/ui/screens/kidsvideos/kidsvideos.dart';
import 'package:prophetspath/ui/screens/prayer/prayertimeScreen.dart';
import 'package:prophetspath/ui/screens/radio_screen/radio_screen.dart';
import 'package:prophetspath/ui/screens/tasbih_counter/tasbih.dart';
import 'package:prophetspath/utils/app_style.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final name = 'The Prophets Path';
    final email = 'Dua & Zikar';

    return Drawer(
        child: Material(
      color: AppStyle.primaryColor,
      child: ListView(
        children: <Widget>[
          buildHeader(name: name, email: email),
          Container(
            padding: padding,
            child: Column(
              children: [
                buildMenuItem(
                  text: 'Prayer Time',
                  icon: Image.asset(
                    "assets/icons/speaker.png",
                    width: 30,
                  ),
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Quran Radio',
                  icon: Image.asset(
                    "assets/icons/radio.png",
                    width: 25,
                  ),
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Tasbih Counter',
                  icon: Image.asset(
                    "assets/icons/tasbih_white.png",
                    width: 30,
                  ),
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Kids Video',
                  icon: Image.asset(
                    "assets/icons/child-game.png",
                    width: 30,
                  ),
                  onClicked: () => selectedItem(context, 3),
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white70),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'Feedback',
                  icon: Image.asset(
                    "assets/icons/positive-review.png",
                    width: 30,
                  ),
                  onClicked: () => selectedItem(context, 4),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'About The Prophets Path',
                  icon: Image.asset(
                    "assets/icons/information.png",
                    width: 30,
                  ),
                  onClicked: () => selectedItem(context, 5),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildHeader({
    required String name,
    required String email,
  }) =>
      Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      );

  Widget buildMenuItem({
    required String text,
    required Image icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return InkWell(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(text, style: TextStyle(color: color, fontSize: 16)),
        ]),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PrayerTimeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RadioScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TasbihCounter(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => KidsVideos(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FeedbackScreen(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutApp(),
        ));
        break;
    }
  }
}
