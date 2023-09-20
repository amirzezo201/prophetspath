import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/providers/last_read_surah_provider.dart';
import 'package:prophetspath/ui/screens/surah_screen/surah_screen.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class SurahItemWidget extends StatefulWidget {
  final Surah surah;
  const SurahItemWidget({Key? key, required this.surah}) : super(key: key);

  @override
  State<SurahItemWidget> createState() => _SurahItemWidgetState();
}

class _SurahItemWidgetState extends State<SurahItemWidget> {
  @override
  Widget build(BuildContext context) {
    Surah surah = widget.surah;
    return InkWell(
      onTap: () async {
        context.read<LastReadSurahProvider>().updateLastReadSurah(surah);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SurahScreen(surah: surah)),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppStyle.whiteColor,
            boxShadow: AppStyle.shadow,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // surah number widget
            Container(
              width: 30,
              height: 35,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppStyle.primaryColor),
              child: Center(
                  child: Text(
                '${surah.number}',
                style:
                    const TextStyle(color: AppStyle.whiteColor, fontSize: 14),
              )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // surah name in english
                Text(
                  surah.enName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                // surah name translate
                Text(
                  '${surah.enNameTrans} (${surah.numberOfAyahs})',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const Spacer(),

            // surah name
            Text(surah.name, style: AppStyle.ayahTextStyle),
          ])),
    );
  }
}
