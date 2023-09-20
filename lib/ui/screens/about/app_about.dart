import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

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
        title: const Text(
          "About Prophets Path",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(AppStyle.paddin),
        child: Text(
          "without any interpretation, exclusion or selection. Our app offers features such as Prayer Times, Audio Quran, Duas and more to make it easier for our users to engage with the word of God. Our app will always remain free and without any advertisements for user comfort and convenience.Customer privacy is our top priority; we do not collect any personal identifiable information and will never share any data about our customers with anyone.The Prophets Path is supported by Propeth. We value feedback from our customers every step of the way - please feel free to reach us at amir@amirgeek.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: AppStyle.darkblue, height: 1.5),
        ),
      ),
    );
  }
}
