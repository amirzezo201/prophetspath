import 'package:flutter/material.dart';
import 'package:prophetspath/ui/screens/emotion/emotion_manual.dart';
import 'package:prophetspath/ui/screens/explorebytopic/explore_detail.dart';
import 'package:prophetspath/ui/screens/explorebytopic/explore_hadith.dart';
import 'package:prophetspath/ui/screens/kidsvideos/kidsvideos.dart';
import 'package:prophetspath/ui/screens/quran/quran.dart';
import 'package:prophetspath/utils/app_style.dart';

class ExploreToggle extends StatefulWidget {
  const ExploreToggle({
    super.key,
    required this.explorecategory,
  });
  final String explorecategory;
  @override
  _ExploreToggleState createState() => _ExploreToggleState();
}

class _ExploreToggleState extends State<ExploreToggle> {
  bool _isToggleOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          widget.explorecategory,
          style: const TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isToggleOn = !_isToggleOn;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: AppStyle.paddin),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _isToggleOn ? AppStyle.primaryColor : AppStyle.darkblue,
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Text(
                        'From Quran',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Text(
                        'From Hadith',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _isToggleOn
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _isToggleOn
                ? ExploreQuran(explorecategory: '${widget.explorecategory}')
                : ExploreHadithScreen(
                    explorecategory: '${widget.explorecategory}',
                  ),
          ),
        ],
      ),
    );
  }
}
