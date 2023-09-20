import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Feedback",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Center(
          child: Text(
        "Feedback",
        style: TextStyle(fontSize: 18, color: AppStyle.darkblue),
      )),
    );
  }
}
