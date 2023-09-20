import 'package:flutter/material.dart';
import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/models/surah_list.dart';
import 'package:prophetspath/ui/screens/home_screen/widgets/surah_listview_widget.dart';
import 'package:prophetspath/utils/app_style.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});
  static String routeName = "/quran";

  @override
  State<Quran> createState() => _QuranState();
}

late Future<Surah?> lastReadSurah;
final TextEditingController searchBarController = TextEditingController();
List<Surah> surahs = surahsData;
bool isOpened = false;

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: const Text(
          "The Quran",
          style: TextStyle(
            color: AppStyle.darkblue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppStyle.paddin),
            child: SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      width: isOpened ? MediaQuery.of(context).size.width : 50,
                      height: 50,
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 247, 247),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0.2,
                            blurRadius: 3,
                            offset: const Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: Icon(
                                      isOpened ? Icons.close : Icons.search,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (isOpened) {
                                        surahs = surahsData;
                                        isOpened = false;
                                        searchBarController.text = '';
                                      } else {
                                        isOpened = true;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: isOpened
                                    ? TextField(
                                        controller: searchBarController,
                                        onChanged: (value) {
                                          setState(() {
                                            surahs = surahsData
                                                .where((element) => element
                                                    .enName
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase()))
                                                .toList();
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SuarhListViewWidget(surahs: surahs)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:prophetspath/models/surah.dart';
// import 'package:prophetspath/models/surah_list.dart';
// import 'package:prophetspath/ui/screens/home_screen/widgets/surah_listview_widget.dart';
// import 'package:prophetspath/utils/app_style.dart';

// class Quran extends StatefulWidget {
//   const Quran({super.key});
//   static String routeName = "/quran";

//   @override
//   State<Quran> createState() => _QuranState();
// }

// late Future<Surah?> lastReadSurah;
// final TextEditingController searchBarController = TextEditingController();
// List<Surah> surahs = surahsData;
// bool isOpened = false;

// class _QuranState extends State<Quran> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.offwhite,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppStyle.offwhite,
//         title: const Text(
//           "The Quran",
//           style: TextStyle(
//               color: AppStyle.darkblue,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(AppStyle.paddin),
//             child: SizedBox(
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: AnimatedContainer(
//                       width: isOpened ? MediaQuery.of(context).size.width : 50,
//                       height: 50,
//                       duration: const Duration(milliseconds: 400),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 248, 247, 247),
//                         boxShadow: <BoxShadow>[
//                           BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               spreadRadius: 0.2,
//                               blurRadius: 3,
//                               offset: const Offset(2, 2))
//                         ],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Directionality(
//                         textDirection: TextDirection.ltr,
//                         child: Row(
//                           children: [
//                             AnimatedContainer(
//                               duration: const Duration(milliseconds: 400),
//                               child: Material(
//                                 type: MaterialType.transparency,
//                                 child: InkWell(
//                                   borderRadius: const BorderRadius.horizontal(
//                                     right: Radius.circular(10),
//                                   ),
//                                   child: Padding(
//                                       padding: const EdgeInsets.all(13),
//                                       child: Icon(
//                                         isOpened ? Icons.close : Icons.search,
//                                       )),
//                                   onTap: () {
//                                     setState(() {
//                                       if (isOpened) {
//                                         surahs = surahsData;
//                                         isOpened = false;
//                                         searchBarController.text = '';
//                                       } else {
//                                         isOpened = true;
//                                       }
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 padding: const EdgeInsets.only(left: 16),
//                                 child: isOpened
//                                     ? TextField(
//                                         controller: searchBarController,
//                                         onSubmitted: (v) {
//                                           setState(() {
//                                             surahs = surahsData
//                                                 .where((element) => element.name
//                                                     .contains(
//                                                         searchBarController
//                                                             .text))
//                                                 .toList();
//                                           });
//                                         },
//                                         decoration: const InputDecoration(
//                                             border: InputBorder.none),
//                                       )
//                                     : null,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   SuarhListViewWidget(
//                     surahs: surahs,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
