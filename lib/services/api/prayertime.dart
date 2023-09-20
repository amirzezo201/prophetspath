import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prophetspath/models/prayertime_model.dart';

class PrayerTimeAPi {
  List<Datum> datumList = [];
  Future<List<Datum>> getPrayerTime() async {
    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var latitude = position.latitude;
    var longitude = position.longitude;
    // Get current date
    DateTime now = DateTime.now();
    var year = now.year;
    var month = now.month;
    try {
      var url = Uri.parse(
          "https://api.aladhan.com/v1/calendar/$year/$month?latitude=$latitude&longitude=$longitude&method=1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        PrayerTime prayerTimeList = PrayerTime.fromJson(decodedJson);
        for (var element in prayerTimeList.data) {
          datumList.add(Datum(timings: element.timings, date: element.date));
        }
      }
      return datumList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
