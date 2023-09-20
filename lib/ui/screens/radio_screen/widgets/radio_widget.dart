import 'package:flutter/material.dart';
import 'package:prophetspath/models/radio.dart';
import 'package:prophetspath/ui/common/play_button.dart';
import 'package:prophetspath/utils/app_style.dart';

class RadioWidget extends StatelessWidget {
  final int index;
  final RadioModel radioModel;
  const RadioWidget({Key? key, required this.radioModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppStyle.whiteColor,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        leading: PlayButton(
          index: index,
          url: radioModel.url,
        ),
        title: Text(
          radioModel.name,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
