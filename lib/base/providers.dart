import 'package:prophetspath/providers/audio_player_provider.dart';
import 'package:prophetspath/providers/bookmark_provider.dart';
import 'package:prophetspath/providers/last_read_surah_provider.dart';
import 'package:prophetspath/providers/radio_provider.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<AudioPlayerProvider>(
    create: (_) => AudioPlayerProvider(),
  ),
  ChangeNotifierProvider<BookMarkProvider>(
    create: (_) => BookMarkProvider(),
  ),
  ChangeNotifierProvider<RadioProvider>(
    create: (_) => RadioProvider(),
  ),
  ChangeNotifierProvider<LastReadSurahProvider>(
    create: (_) => LastReadSurahProvider(),
  ),
];
