import 'package:flutter/services.dart';
import 'package:prophetspath/models/emotion_model.dart';

class EmotionService {
  Future<List<EmotionModel>?> getemotiondata() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/emotion.json');
      List<EmotionModel> emotionList = emotionModelFromJson(response);
      return emotionList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
