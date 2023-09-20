import 'dart:convert';

class PrayerTime {
  final List<Datum> data;

  PrayerTime({
    required this.data,
  });

  factory PrayerTime.fromRawJson(String str) =>
      PrayerTime.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrayerTime.fromJson(Map<String, dynamic> json) => PrayerTime(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final Timings timings;
  final Date date;

  Datum({
    required this.timings,
    required this.date,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        timings: Timings.fromJson(json["timings"]),
        date: Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
      };
}

class Date {
  final String readable;
  final String timestamp;
  final Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
  });

  factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        gregorian: Gregorian.fromJson(json["gregorian"]),
      );

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "gregorian": gregorian.toJson(),
      };
}

class Gregorian {
  final String date;

  Gregorian({
    required this.date,
  });

  factory Gregorian.fromRawJson(String str) =>
      Gregorian.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
      };
}

class Timings {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  Timings({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromRawJson(String str) => Timings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Isha": isha,
      };
}
