import 'package:flutter/material.dart';
import 'package:prophetspath/models/reciter.dart';
import 'package:prophetspath/providers/audio_player_provider.dart';
import 'package:prophetspath/ui/common/play_button.dart';
import 'package:prophetspath/utils/app_style.dart';

class ReciterItemWidget extends StatelessWidget {
  final int selectedSurah;
  final Reciter reciter;
  const ReciterItemWidget(
      {Key? key, required this.reciter, required this.selectedSurah})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppStyle.whiteColor,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        title: Text(
          reciter.name,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text(reciter.rewaya, textDirection: TextDirection.ltr),
        leading: PlayButton(
          index: reciter.id,
          url:
              AudioPlayerProvider().intiializUrl(reciter.server, selectedSurah),
        ),
      ),
    );
  }
}
