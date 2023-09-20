import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  String _url = '';
  String get url => _url;
  set url(String value) {
    _url = value;
    notifyListeners();
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  int? _index;
  int? get index => _index;
  set index(int? value) {
    _index = value;
    notifyListeners();
  }

  String intiializUrl(String url, int number) {
    String url0 = url.endsWith('/') ? url : '$url/';
    if (number < 10) return '${url0}00$number.mp3';
    if (number < 100) return '${url0}0$number.mp3';
    return '$url0$number.mp3';
  }

  AudioPlayer advancedPlayer = AudioPlayer();
  void stopAudio() {
    index = null;
    _isPlaying = false;
    advancedPlayer.stop();
    notifyListeners();
  }

  void playAudio(String urlString) async {
    url = urlString;
    if (!_isPlaying) {
      _isPlaying = true;
      advancedPlayer.play(UrlSource(url));
      advancedPlayer.onPlayerComplete.listen((event) {
        _isPlaying = false;
        index = null;
        notifyListeners();
      });
      notifyListeners();
    } else {
      stopAudio();
    }
  }
}
