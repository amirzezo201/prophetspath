import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prophetspath/utils/app_style.dart';

class TasbihCounter extends StatefulWidget {
  const TasbihCounter({super.key});

  @override
  State<TasbihCounter> createState() => _TasbihCounterState();
}

class _TasbihCounterState extends State<TasbihCounter> {
  int _counter = 0;
  int target = 33;

  void _incrementCounter() {
    setState(() {
      if (_counter < target) {
        _counter++;
      } else {}
    });
  }

  void _target(int x) {
    setState(() {
      target = x;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
          backgroundColor: AppStyle.primaryColor,
          centerTitle: true,
          title: const Text(
            "Tasbih Counter",
            style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1.5),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _resetCounter,
                style: ElevatedButton.styleFrom(
                  elevation: 0.1,
                  backgroundColor: AppStyle.offwhite,
                  minimumSize: const Size(60, 60),
                  side: const BorderSide(
                      width: 2,
                      color: AppStyle.primaryColor,
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/reload.svg',
                  // ignore: deprecated_member_use
                  color: AppStyle.primaryColor,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _TasbihTarget(context, _target));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.1,
                  backgroundColor: AppStyle.offwhite,
                  minimumSize: const Size(60, 60),
                  side: const BorderSide(
                      width: 2,
                      color: AppStyle.primaryColor,
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/setting.svg',
                  // ignore: deprecated_member_use
                  color: AppStyle.primaryColor,
                  width: 30,
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Column(
            children: [
              SvgPicture.asset(
                "assets/icons/target.svg",
                // ignore: deprecated_member_use
                color: AppStyle.primaryColor,
                width: 50,
              ),
              Text(
                "Target".toUpperCase(),
                style: const TextStyle(color: Colors.black54, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                target.toString(),
                style: const TextStyle(
                    color: AppStyle.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: InkWell(
              onTap: _incrementCounter,
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.4),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 20.0, color: AppStyle.primaryColor),
                    color: AppStyle.offwhite,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.6)),
                child: Center(
                  child: _counter == 0
                      ? const Text(
                          'Tap to start',
                          style: TextStyle(
                              fontSize: 20.0, color: AppStyle.primaryColor),
                        )
                      : Text(
                          '$_counter',
                          style: const TextStyle(
                              fontSize: 60.0, color: AppStyle.primaryColor),
                        ),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

Widget _TasbihTarget(BuildContext context, Function target) {
  var value = 0;
  TextEditingController customtarget = TextEditingController();
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    title: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        children: const [
          Text(
            'Select Amount',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Select how many times you like to Target",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          )
        ],
      )),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  value = 33;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyle.primaryColor,
                  minimumSize: const Size(130, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Text(
                  "33",
                  style: TextStyle(fontSize: 18),
                )),
            ElevatedButton(
                onPressed: () {
                  value = 100;
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white12,
                  minimumSize: const Size(130, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  side: const BorderSide(
                      width: 2,
                      color: AppStyle.primaryColor,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  "100",
                  style: TextStyle(fontSize: 18, color: AppStyle.primaryColor),
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  value = 1000;
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white12,
                  minimumSize: const Size(130, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  side: const BorderSide(
                      width: 2,
                      color: AppStyle.primaryColor,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  "1000",
                  style: TextStyle(fontSize: 18, color: AppStyle.primaryColor),
                )),
            GestureDetector(
              onTap: () {
                value = 0;
              },
              child: SizedBox(
                width: 130,
                child: TextField(
                  onChanged: (val) {
                    value = int.parse(val);
                  },
                  controller: customtarget,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppStyle.primaryColor, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      hintText: "Custom",
                      hintStyle: TextStyle(color: AppStyle.primaryColor)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  target(value);
                  Navigator.pop(context);

                  // Navigator.of(context).pop(target);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white12,
                  minimumSize: const Size(130, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  side: const BorderSide(
                      width: 2,
                      color: AppStyle.primaryColor,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                      color: AppStyle.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
