import 'package:flutter/material.dart';
import 'package:prophetspath/models/surah.dart';
import 'package:prophetspath/providers/audio_player_provider.dart';
import 'package:prophetspath/ui/screens/surah_screen/widgets/ayah_list_widget.dart';
import 'package:prophetspath/ui/screens/surah_screen/widgets/surah_des_widget.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  final Surah surah;
  const SurahScreen({Key? key, required this.surah}) : super(key: key);
  static String routeName = "/surah";

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    var audioProvider = context.read<AudioPlayerProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.surah.enName,
          style: const TextStyle(
            color: AppStyle.darkblue,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios, color: AppStyle.darkblue),
          onPressed: () {
            Navigator.pop(context);

            audioProvider.index = null;
            audioProvider.isPlaying = false;
            audioProvider.advancedPlayer.stop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
              top: 0,
              left: AppStyle.paddin + 5,
              right: AppStyle.paddin + 5,
              bottom: AppStyle.paddin + 5),
          child: Column(
            children: [
              //
              SurahDescription(surah: widget.surah),
              // empty space
              const SizedBox(height: 20),
              AyahListWidget(number: widget.surah.number)
            ],
          ),
        ),
      ),
    );
  }
}
