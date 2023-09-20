import 'package:flutter/material.dart';
import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/services/storage/last_read_surah.dart';
import 'package:prophetspath/ui/common/itemtile.dart';
import 'package:prophetspath/ui/common/navigation_drawer_widget.dart';
import 'package:prophetspath/ui/screens/home_screen/widgets/last_reading_widget.dart';
import 'package:prophetspath/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List homeItems = [
  {
    "iconData": "assets/icons/islam-icon.svg",
    "itemName": "Promises of Allah",
    'route': '/promisesofAllah'
  },
  {
    "iconData": "assets/icons/happy-icon.svg",
    "itemName": "Emotions",
    'route': '/emotion'
  },
  {
    "iconData": "assets/icons/praying-hand-icon.svg",
    "itemName": "Duas",
    'route': '/dua'
  },
  {
    "iconData": "assets/icons/search-icon.svg",
    "itemName": "Explore By Topic",
    'route': '/exploretopic'
  },
  {
    "iconData": "assets/icons/kaaba-icon.svg",
    "itemName": "Qibla",
    'route': '/qibla'
  },
  {
    "iconData": "assets/icons/boy-icon.svg",
    "itemName": "Kids",
    'route': '/kids'
  },
];

class _HomeScreenState extends State<HomeScreen> {
  late Future<Surah?> lastReadSurah;
  @override
  void initState() {
    super.initState();
    lastReadSurah = LastReadSurah().getLastRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: AppStyle.darkblue,
          elevation: 0,
        ),
      ),
      backgroundColor: AppStyle.darkblue,
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const LastReadSurahWidget(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppStyle.offwhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    const ItemTile(
                      iconData: "assets/icons/quran-icon.svg",
                      itemName: "The Quran",
                      navigatoTo: "/quran",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: homeItems.length,
                        itemBuilder: (context, index) => ItemTile(
                          iconData: homeItems[index]['iconData'],
                          itemName: homeItems[index]['itemName'],
                          navigatoTo: homeItems[index]['route'],
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2.2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
