import 'package:flutter/material.dart';
import 'package:prophetspath/models/duamodel.dart';
import 'package:prophetspath/services/api/emotion_api.dart';
import 'package:prophetspath/ui/screens/emotion/emotion_detail.dart';
import 'package:prophetspath/utils/app_style.dart';

class Emotion extends StatefulWidget {
  const Emotion({super.key});
  static String routeName = "/emotion";

  @override
  State<Emotion> createState() => _EmotionState();
}

class _EmotionState extends State<Emotion> {
  @override
  List emotionList = [
    "Angry",
    "Anxious",
    "Bored",
    "Confident",
    "Confused",
    "Content",
    "Depressed",
    "Doubtful",
    "Grateful",
    "Greedy",
    "Guilty",
    "Happy",
    "Hurt",
    "Hypocritical",
    "Indecisive",
    "Jealous",
    "Lazy",
    "Lonely",
    "Lost",
    "Nervous",
    "Overwhelmed",
    "Regret",
    "Sad",
    "Scared",
    "Suicidal",
    "Tired",
    "Unloved",
    "Weak",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyle.primaryColor,
          title: const Text(
            "Dua`s based on Emotion",
            style: TextStyle(
                color: AppStyle.offwhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppStyle.offwhite,
              )),
        ),
        backgroundColor: AppStyle.offwhite,
        body: Padding(
          padding: EdgeInsets.all(AppStyle.paddin),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            scrollDirection: Axis.vertical,
            itemCount: emotionList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmotionDetail(
                              emotionname: emotionList[index],
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppStyle.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    emotionList[index],
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
