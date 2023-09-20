import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prophetspath/models/ayah.dart';
import 'package:prophetspath/ui/screens/surah_screen/widgets/custom_icon_buttton.dart';
import 'package:prophetspath/utils/app_style.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    Key? key,
    required this.ayah,
  }) : super(key: key);

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        icon: const Icon(Icons.copy_outlined),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppStyle.primaryColor,
              margin: EdgeInsets.all(10),
              behavior: SnackBarBehavior.floating,
              content: Text(
                "Copied!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          );
          Clipboard.setData(ClipboardData(
              text:
                  '[${ayah.ayahTextAr} \n\n\n ${ayah.ayahTextEn}][${ayah.number}:${ayah.surahNumber}]'));
        },
        size: 20);
  }
}
