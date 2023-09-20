import 'package:flutter/material.dart';
import 'package:prophetspath/base/demodata.dart';
import 'package:prophetspath/utils/app_style.dart';

class PromisesOfAllah extends StatefulWidget {
  const PromisesOfAllah({super.key});
  static String routeName = "/promisesofAllah";

  @override
  State<PromisesOfAllah> createState() => _PromisesOfAllahState();
}

class _PromisesOfAllahState extends State<PromisesOfAllah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        centerTitle: true,
        title: const Text(
          "Promises of Allah",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppStyle.darkblue,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppStyle.paddin),
        child: ListView.builder(
          itemCount: exploreItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: AppStyle.shadow,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              padding: const EdgeInsets.symmetric(
                  vertical: AppStyle.paddin, horizontal: AppStyle.paddin * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(exploreItems[index]['arabic'],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                height: 2,
                                color: AppStyle.primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.060,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Translation',
                    style: TextStyle(
                        color: AppStyle.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      exploreItems[index]['translation'],
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
