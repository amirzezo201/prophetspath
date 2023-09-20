import 'package:flutter/material.dart';
import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/utils/app_style.dart';

class SurahDescription extends StatelessWidget {
  final Surah surah;
  const SurahDescription({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyle.primaryColor),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                surah.name,
                textAlign: TextAlign.center,
                style: AppStyle.titleTextStyle.copyWith(color: Colors.white),
              ),
              Text(
                surah.enName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.white.withOpacity(0.3),
                  thickness: 1,
                ),
              ),
              Text(
                '${surah.place} - verses ${surah.numberOfAyahs}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'UthmanTN',
                  height: 2,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ]));
  }
}
