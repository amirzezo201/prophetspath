import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prophetspath/models/prayertime_model.dart';
import 'package:prophetspath/services/api/prayertime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prophetspath/ui/screens/countDown/countdown.dart';
import 'package:prophetspath/ui/screens/qibla_direction/location_error_widget.dart';
import 'package:prophetspath/utils/app_style.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  bool newLoading = true;
  String place = '';
  late List<Datum> prayertimeList = [];
  late List<Datum> currentDayPrayertime = [];
  var remaininghourr;
  var remainingminutee;
  var tiimings;
  bool loading = true;
  DateTime now = DateTime.now();
  var upcomingPrayer;
  var upcoming;
  var acctualTime;
  late String reamingTime;
  late String timeValue;
  late DateTime combinedDateTime;
  List prayerNameList = [
    'Fajar',
    'Zuhr',
    'Asar',
    'Magrib',
    'Isha',
  ];

  @override
  void initState() {
    super.initState();
    prayerTime();
    getCurrentMonthAndDay();
    requestLocationPermission();
  }

  Map<String, String> getCurrentMonthAndDay() {
    DateTime now = DateTime.now();
    DateFormat monthFormatter = DateFormat.MMMM();
    DateFormat dayFormatter = DateFormat.EEEE();
    DateFormat dateFormatter = DateFormat.d();

    String monthName = monthFormatter.format(now);
    String dayName = dayFormatter.format(now);
    int date = int.parse(dateFormatter.format(now));

    return {
      'month': monthName,
      'day': dayName,
      'date': date.toString(),
    };
  }

  void requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      location();
    } else if (status.isDenied) {
      const LocationErrorWidget();
    }
  }

  void location() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Future<String?> locationName =
        getLocationName(position.latitude, position.longitude);
  }

  Future<String?> getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        setState(() {
          place = placemarks[0].locality.toString();
        });
      }
      return null;
    } catch (e) {
      throw (e.toString());
    }
  }

  void prayerTime() async {
    prayertimeList = (await PrayerTimeAPi().getPrayerTime());
    DateTime now = DateTime.now();
    int currentDate = now.day;
    for (int i = 0; i < prayertimeList.length; i++) {
      if (i == currentDate - 1) {
        setState(() {
          loading = false;
          currentDayPrayertime.add(prayertimeList[i]);
        });
      }
    }
    // print(currentDayPrayertime.first.date.gregorian.date);
  }

  void getTiming() {
    tiimings = {
      '0': currentDayPrayertime.first.timings.fajr,
      '1': currentDayPrayertime.first.timings.dhuhr,
      '2': currentDayPrayertime.first.timings.asr,
      '3': currentDayPrayertime.first.timings.maghrib,
      '4': currentDayPrayertime.first.timings.isha,
    };
    bool isIsha = true;
    for (int x = 0; x < tiimings.length; x++) {
      String timeString = tiimings[x.toString()].toString();
      int hour = int.parse(timeString.substring(0, 2));
      int minute = int.parse(timeString.substring(3, 5));

      DateTime specificTime =
          DateTime(now.year, now.month, now.day, hour, minute);

      bool isSpecificTimeGreaterOrEqual =
          specificTime.isAfter(now) || specificTime.isAtSameMomentAs(now);

      if (isSpecificTimeGreaterOrEqual == true) {
        isIsha == false;
        print(x);
        print(tiimings[0.toString()].toString());
        acctualTime = tiimings[x.toString()].toString();
        isIsha = true;
        String timeString = tiimings[x.toString()].toString();
        int specificHour = int.parse(timeString.substring(0, 2));
        int specificMinute = int.parse(timeString.substring(3, 5));

        DateTime specificTimess = DateTime(
          now.year,
          now.month,
          now.day,
          specificHour,
          specificMinute,
        );
        reamingTime = specificTimess.difference(now).toString();

        setState(() {});

        if (x == 0) {
          upcomingPrayer = 'Fajar';
        } else if (x == 1) {
          upcomingPrayer = 'Zuhr';
        } else if (x == 2) {
          upcomingPrayer = 'Asar';
        } else if (x == 3) {
          upcomingPrayer = 'Magrib';
        } else if (x == 4) {
          upcomingPrayer = 'Isha';
        }
        upcoming = tiimings[x.toString()].toString();

        x = tiimings.length;
      }
      if (isIsha == false) {
        acctualTime = tiimings[x.toString()].toString();
        String timeString = tiimings[0.toString()].toString();
        int specificHour = int.parse(timeString.substring(0, 2));
        int specificMinute = int.parse(timeString.substring(3, 5));

        DateTime specificTimess = DateTime(
          now.year,
          now.month,
          now.day,
          specificHour,
          specificMinute,
        );
        reamingTime = specificTimess.difference(now).toString();
        upcomingPrayer = 'Fajar';
      }
    }
    setState(() {
      newLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(acctualTime);
    if (!loading) {
      getTiming();
    }

    Map<String, String> currentDateTime = getCurrentMonthAndDay();
    String? currentMonth = currentDateTime['month'];
    String? currentDay = currentDateTime['day'];
    String? currentDate = currentDateTime['date'];

    if (newLoading == false) {
      timeValue = reamingTime;
      List<String> components = timeValue.split(':');
      remaininghourr = int.parse(components[0]);
      remainingminutee = int.parse(components[1]);
      DateTime currentDate = DateTime.now();
      String formattedDate = currentDate.toString().substring(0, 10);
      String dateTimeString = "${formattedDate} ${acctualTime}";

      String formattedDateTime = dateTimeString.replaceAll(" (PKT)", "");
      combinedDateTime = DateTime.parse(formattedDateTime);
    }

    // setState(() {});
    // Code to execute after the delay

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyle.offwhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyle.offwhite,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppStyle.darkblue,
              )),
          title: const Text(
            "Prayer Time",
            style: TextStyle(
                color: AppStyle.darkblue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppStyle.primaryColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(AppStyle.paddin),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        place,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppStyle.primaryColor,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$currentDay, $currentMonth $currentDate',
                        style: const TextStyle(
                            color: AppStyle.darkblue,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: AppStyle.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0.2,
                                  blurRadius: 3,
                                  offset: const Offset(2, 2))
                            ],
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${upcomingPrayer} " + " in",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppStyle.whiteColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Row(
                              //   children: [
                              //     Text(remaininghourr.toString()),
                              //   ],
                              // ),
                              CountDownText(
                                  due: combinedDateTime
                                  // "2022-12-03 00:00:00".
                                  ,
                                  finishedText: "Done",
                                  showLabel: true,
                                  longDateName: true,
                                  daysTextLong: ":",
                                  hoursTextLong: ":",
                                  minutesTextLong: ":",
                                  secondsTextLong: "",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ))),
                      Expanded(
                        child: ListView.builder(
                          itemCount: prayerNameList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 80,
                                margin: const EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  color: AppStyle.whiteColor,
                                  boxShadow: AppStyle.shadow,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        prayerNameList[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        tiimings[index.toString()]
                                            .toString()
                                            .substring(0, 5),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: AppStyle.primaryColor),
                                      )
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                    ]),
              ),
      ),
    );
  }
}
