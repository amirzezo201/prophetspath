import 'package:flutter/material.dart';
import 'package:prophetspath/ui/screens/dua/dua_detail.dart';
import 'package:prophetspath/utils/app_style.dart';

class DuaMain extends StatefulWidget {
  const DuaMain({super.key});
  static String routeName = "/dua";

  @override
  State<DuaMain> createState() => _DuaMainState();
}

class _DuaMainState extends State<DuaMain> {
  final List duaname = [
    {"category": "Morning", "iconImage": "assets/icons/morning.png"},
    {"category": "Evening", "iconImage": "assets/icons/evening.png"},
    {"category": "Before Sleep", "iconImage": "assets/icons/beforesleep.png"},
    {"category": "Salah", "iconImage": "assets/icons/salah.png"},
    {"category": "After Salah", "iconImage": "assets/icons/aftersalah.png"},
    {
      "category": "Praises of Allah",
      "iconImage": "assets/icons/namesofallah.png"
    },
    {"category": "Salawat", "iconImage": "assets/icons/salah.png"},
    {"category": "Quranic Duas", "iconImage": "assets/icons/quranic_dua.png"},
    {"category": "Sunnah Duas", "iconImage": "assets/icons/sunnah_dua.png"},
    {"category": "Ruqyah & Illness", "iconImage": "assets/icons/illness.png"},
    {"category": "Dhikar for All Times", "iconImage": "assets/icons/time.png"},
    {"category": "Waking Up", "iconImage": "assets/icons/wakeup.png"},
    {"category": "Nightmares", "iconImage": "assets/icons/nightmare.png"},
    {"category": "Clothes", "iconImage": "assets/icons/clothing.png"},
    {"category": "Lavatory & Wudu", "iconImage": "assets/icons/wudu.png"},
    {"category": "Food & Drink", "iconImage": "assets/icons/food_drink.png"},
    {"category": "Home", "iconImage": "assets/icons/home.png"},
    {"category": "Adhan & Masjid", "iconImage": "assets/icons/ahdan.png"},
    {"category": "Istikharah", "iconImage": "assets/icons/istekarah.png"},
    {"category": "Gatherings", "iconImage": "assets/icons/gathering.png"},
    {
      "category": "Difficulties & Happiness",
      "iconImage": "assets/icons/Difficulty.png"
    },
    {
      "category": "Protection of Iman",
      "iconImage": "assets/icons/protection.png"
    },
    {"category": "Hajj & Umrah", "iconImage": "assets/icons/hajj.png"},
    {"category": "Travel", "iconImage": "assets/icons/traveling.png"},
    {
      "category": "Money & Shopping",
      "iconImage": "assets/icons/money_shopping.png"
    },
    {
      "category": "Social Interactions",
      "iconImage": "assets/icons/Interactions.png"
    },
    {
      "category": "Marriage & Children",
      "iconImage": "assets/icons/Childrens.png"
    },
    {"category": "Death", "iconImage": "assets/icons/deadbody.png"},
    {"category": "Nature", "iconImage": "assets/icons/nature.png"},
    {"category": "Istighfar", "iconImage": "assets/icons/istekarah.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: const Text(
          "Main Dua's",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppStyle.darkblue,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppStyle.paddin),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: duaname.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DuaDetailScreen(
                            duaname: duaname[index]['category'],
                          )));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppStyle.whiteColor,
                boxShadow: AppStyle.shadow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.height * 0.065,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppStyle.secondaryColor,
                  ),
                  child: Image.asset(
                    duaname[index]['iconImage'],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Expanded(
                  child: Text(
                    duaname[index]['category'],
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                )
              ]),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
        ),
      ),
    );
  }
}
