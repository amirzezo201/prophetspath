import 'package:flutter/material.dart';
import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/providers/last_read_surah_provider.dart';
import 'package:prophetspath/ui/screens/surah_screen/surah_screen.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:provider/provider.dart';

class LastReadSurahWidget extends StatefulWidget {
  const LastReadSurahWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LastReadSurahWidget> createState() => _LastReadSurahWidgetState();
}

class _LastReadSurahWidgetState extends State<LastReadSurahWidget> {
  @override
  void initState() {
    super.initState();
    context.read<LastReadSurahProvider>().getLastReadSurah();
  }

  @override
  Widget build(BuildContext context) {
    Surah? surah = context.watch<LastReadSurahProvider>().surah;

    // last reading widget
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppStyle.paddin),
      height: MediaQuery.of(context).size.height * 0.35,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppStyle.darkblue,
      ),
      //
      child: Column(
        children: [
          Image.asset('assets/images/quran.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              surah == null
                  ? const SizedBox(
                      width: 150,
                      child: Divider(
                        thickness: 1.8,
                        color: Color(0x9CEAEAEA),
                      ),
                    )
                  : Text(surah.name,
                      style: AppStyle.titleTextStyle
                          .copyWith(color: AppStyle.whiteColor)),
              surah == null ? const SizedBox(height: 15) : const SizedBox(),
              surah == null
                  ? const SizedBox(
                      width: 130,
                      child: Divider(
                        thickness: 1.8,
                        color: Color(0x9CEAEAEA),
                      ),
                    )
                  : Text(surah.enName,
                      style: TextStyle(
                          fontSize: 15, color: Colors.white.withOpacity(0.7))),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: AppStyle.primaryColor,
                onPressed: () => surah == null
                    ? null
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SurahScreen(surah: surah))),
                      ),
                child: const Text(
                  "Continue Reading",
                  style:
                      TextStyle(color: AppStyle.whiteColor, letterSpacing: 1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
