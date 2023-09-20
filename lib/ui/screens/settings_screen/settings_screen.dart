import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = "/setting";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: AppStyle.titleTextStyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Dark Mode',
                              style: AppStyle.bodyTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1.4,
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
