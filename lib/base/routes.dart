import 'package:flutter/material.dart';
import 'package:prophetspath/ui/screens/dua/dua.dart';
import 'package:prophetspath/ui/screens/emotion/emotion_manual.dart';

import 'package:prophetspath/ui/screens/explorebytopic/explore_topic.dart';
import 'package:prophetspath/ui/screens/kidsvideos/kidsvideos.dart';
import 'package:prophetspath/ui/screens/promisesofalllah/promises_of_allah.dart';
import 'package:prophetspath/ui/screens/qibla_direction/qibla.dart';
import 'package:prophetspath/ui/screens/quran/quran.dart';

final Map<String, WidgetBuilder> routes = {
  Quran.routeName: (context) => const Quran(),
  QiblaDirection.routeName: (context) => const QiblaDirection(),
  KidsVideos.routeName: (context) => const KidsVideos(),
  DuaMain.routeName: (context) => const DuaMain(),
  Emotion.routeName: (context) => Emotion(),
  ExploreTopic.routeName: (context) => const ExploreTopic(),
  PromisesOfAllah.routeName: (context) => const PromisesOfAllah()
};
