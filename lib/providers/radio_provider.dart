import 'package:flutter/material.dart';
import 'package:prophetspath/models/radio.dart';
import 'package:prophetspath/models/reciter.dart';
import 'package:prophetspath/services/api/radio_api.dart';

class RadioProvider extends ChangeNotifier {
  List<Reciter> reciters = [];
  List<RadioModel> radios = [];

  // get all radios and reciters list
  Future getLists() async {
    reciters = await RadioApi().getRecitersList();
    radios = await RadioApi().getRadiosList();
    notifyListeners();
  }
}
