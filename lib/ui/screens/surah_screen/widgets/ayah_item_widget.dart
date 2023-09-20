import 'package:flutter/material.dart';
import 'package:prophetspath/models/ayah.dart';
import 'package:prophetspath/ui/common/my_flutter_app_icons.dart';
import 'package:prophetspath/ui/common/play_button.dart';
import 'package:prophetspath/ui/screens/surah_screen/widgets/bookmark_button.dart';
import 'package:prophetspath/ui/screens/surah_screen/widgets/copy_button.dart';
import 'package:prophetspath/utils/app_style.dart';

class AyahItemWidget extends StatefulWidget {
  final Ayah ayah;
  final int index;
  final bool showAyahNumber;

  const AyahItemWidget(
      {Key? key,
      required this.ayah,
      required this.index,
      required this.showAyahNumber})
      : super(key: key);

  @override
  State<AyahItemWidget> createState() => _AyahItemWidgetState();
}

class _AyahItemWidgetState extends State<AyahItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppStyle.paddin / 2),
      padding: const EdgeInsets.all(AppStyle.paddin / 2),
      decoration: BoxDecoration(
        color: AppStyle.whiteColor,
        boxShadow: AppStyle.shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      //

      child: Column(
        children: [
          // top bar of ayah widget
          SizedBox(
            height: 50,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  // ayah number container
                  widget.showAyahNumber
                      ? Container(
                          width: 33,
                          height: 40,
                          // design
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppStyle.primaryColor,
                          ),
                          //
                          // Counter
                          child: Center(
                            child: Text(
                              '${widget.ayah.number}',
                              style: const TextStyle(
                                  color: AppStyle.whiteColor, fontSize: 16),
                            ),
                          ),
                          //
                        )
                      : Container(),
                  // if the have sajda true
                  widget.ayah.sajda
                      ? IconButton(
                          icon: const Icon(
                            MyFlutterApp.sajdahIcon,
                            color: Colors.amber,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      : Container(),
                  // empty space
                  const Spacer(),
                  // copy button to copy ayah
                  CopyButton(ayah: widget.ayah),
                  PlayButton(index: widget.index, url: widget.ayah.audio),
                  // mark Button to save ayah in bookmark
                  BookMarkButtonWidget(ayah: widget.ayah),
                ],
              ),
            ),
          ),
          //
          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: Colors.grey),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // arabic ayah text
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.ayah.ayahTextAr,
                    textDirection: TextDirection.rtl,
                    style: AppStyle.ayahTextStyle.copyWith(),
                  ),
                ),
                // english ayah text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.ayah.ayahTextEn,
                    textDirection: TextDirection.ltr,
                    style: AppStyle.ayahTextStyle.copyWith(
                      color: const Color.fromARGB(255, 159, 159, 159),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
