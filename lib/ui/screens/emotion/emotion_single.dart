import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prophetspath/models/emotion_model.dart';
import 'package:prophetspath/utils/app_style.dart';

class EmotionSingle extends StatelessWidget {
  EmotionSingle({
    super.key,
    required this.singleDua,
  });
  final EmotionModel singleDua;

  @override
  Widget build(BuildContext context) {
    bool virtueShow = true;
    bool hadithShow = true;
    bool translation = true;
    if (singleDua.virtue == '') {
      virtueShow = false;
    } else {
      bool virtueShow = true;
    }
    if (singleDua.reference == '') {
      hadithShow = false;
    } else {
      bool hadithShow = true;
    }
    if (singleDua.translation == '' || singleDua.transliteration == '') {
      translation = false;
    } else {
      bool translation = true;
    }
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.primaryColor,
        title: Text(
          singleDua.categories,
          style: const TextStyle(
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
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(color: AppStyle.primaryColor),
            padding: EdgeInsets.all(AppStyle.paddin),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    singleDua.title,
                    style: const TextStyle(
                        color: AppStyle.offwhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppStyle.paddin),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: AppStyle.shadow,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppStyle.paddin,
                      horizontal: AppStyle.paddin * 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(singleDua.arabic,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontFamily: 'UthmanTN',
                                    height: 2,
                                    color: AppStyle.primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.060,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      translation
                          ? const SizedBox(
                              height: 20,
                            )
                          : SizedBox(),
                      Text(
                        singleDua.transliteration,
                        style: TextStyle(fontFamilyFallback: ['Roboto']),
                      ),
                      translation
                          ? const SizedBox(
                              height: 20,
                            )
                          : SizedBox(),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          singleDua.translation,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamilyFallback: ['Roboto']),
                        ),
                      ),
                      virtueShow
                          ? const SizedBox(
                              height: 20,
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                      virtueShow
                          ? const Text(
                              "Virtue",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamilyFallback: ['Roboto']),
                            )
                          : Container(),
                      virtueShow
                          ? const SizedBox(
                              height: 10,
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          singleDua.virtue,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      hadithShow
                          ? const Text(
                              "Hadith",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          singleDua.reference,
                          style: TextStyle(
                              fontSize: 14, fontFamilyFallback: ['Roboto']),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
