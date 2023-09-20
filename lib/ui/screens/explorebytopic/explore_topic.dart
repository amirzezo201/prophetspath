import 'package:flutter/material.dart';
import 'package:prophetspath/ui/screens/explorebytopic/explore_toggle.dart';
import 'package:prophetspath/ui/screens/explorebytopic/widget/explore_item.dart';
import 'package:prophetspath/utils/app_style.dart';

import 'explore_detail.dart';

class ExploreTopic extends StatefulWidget {
  const ExploreTopic({super.key});
  static String routeName = "/exploretopic";

  @override
  State<ExploreTopic> createState() => _ExploreTopicState();
}

List exploreItems = [
  {
    "iconData": "assets/icons/business.png",
    "itemName": "Business & Trade",
  },
  {
    "iconData": "assets/icons/carity.png",
    "itemName": "Charity - Zakat",
  },
  {
    "iconData": "assets/icons/clothing.png",
    "itemName": "Clothing",
  },
  {
    "iconData": "assets/icons/death.png",
    "itemName": "Death",
  },
  {
    "iconData": "assets/icons/alchohal.png",
    "itemName": "Drugs & Alcohol",
  },
  {
    "iconData": "assets/icons/extrarelationships.png",
    "itemName": "Extramarital Relations",
  },
  {
    "iconData": "assets/icons/fasting.png",
    "itemName": "Fasting",
  },
  {
    "iconData": "assets/icons/food.png",
    "itemName": "Food",
  },
  {
    "iconData": "assets/icons/gambling.png",
    "itemName": "Gambling",
  },
  {
    "iconData": "assets/icons/homosexual.png",
    "itemName": "Homosexual Relations",
  },
  {
    "iconData": "assets/icons/duas.png",
    "itemName": "Invocations - Duas",
  },
  {
    "iconData": "assets/icons/justice.png",
    "itemName": "Justice",
  },
  {
    "iconData": "assets/icons/hereafter.png",
    "itemName": "Life Hereafter",
  },
  {
    "iconData": "assets/icons/marriage.png",
    "itemName": "Marriage",
  },
  {
    "iconData": "assets/icons/nonmuslim.png",
    "itemName": "Non-Muslims",
  },
  {
    "iconData": "assets/icons/magic.png",
    "itemName": "Occult Practices & Magic",
  },
  {
    "iconData": "assets/icons/oneness.png",
    "itemName": "Oneness of Allah",
  },
  {
    "iconData": "assets/icons/pilgrimage.png",
    "itemName": "Pilgrimage",
  },
  {
    "iconData": "assets/icons/prayer.png",
    "itemName": "Prayers - Salah",
  },
  {
    "iconData": "assets/icons/relationships.png",
    "itemName": "Relationships & Rights",
  },
  {
    "iconData": "assets/icons/tawbah.png",
    "itemName": "Repentance - Tawbah",
  },
  {
    "iconData": "assets/icons/science.png",
    "itemName": "Science",
  },
  {
    "iconData": "assets/icons/unseen.png",
    "itemName": "The Unseen",
  },
  {
    "iconData": "assets/icons/vitues.png",
    "itemName": "Virtues & Conduct",
  },
  {
    "iconData": "assets/icons/women.png",
    "itemName": "Women",
  },
];

class _ExploreTopicState extends State<ExploreTopic> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: const Text(
          "Explore By Topic",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyle.paddin, vertical: AppStyle.paddin),
        child: Column(children: [
          Container(
            height: height * 0.06,
            decoration: BoxDecoration(
              color: AppStyle.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
                child: Text(
              "Get answers from Quran and Hadith",
              style: TextStyle(
                  color: AppStyle.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: exploreItems.length,
              itemBuilder: (context, index) => ExploreItem(
                itemName: exploreItems[index]['itemName'],
                itemIcon: exploreItems[index]['iconData'],
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExploreToggle(
                              explorecategory: exploreItems[index]
                                  ['itemName'])));
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12),
            ),
          ),
        ]),
      ),
    );
  }
}
