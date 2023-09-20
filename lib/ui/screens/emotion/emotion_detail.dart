import 'package:flutter/material.dart';
import 'package:prophetspath/models/emotion_model.dart';
import 'package:prophetspath/services/api/emotion_api.dart';
import 'package:prophetspath/ui/screens/emotion/emotion_single.dart';
import 'package:prophetspath/utils/app_style.dart';

class EmotionDetail extends StatefulWidget {
  const EmotionDetail({super.key, required this.emotionname});
  final String emotionname;
  @override
  State<EmotionDetail> createState() => _EmotionDetailState();
}

class _EmotionDetailState extends State<EmotionDetail> {
  List<EmotionModel>? _emotionModel = [];
  List<EmotionModel>? _specific = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Future getData() async {
    _emotionModel = (await EmotionService().getemotiondata())!;

    for (int i = 0; i < _emotionModel!.length; i++) {
      if (_emotionModel![i].categories == widget.emotionname.capitalize()) {
        _specific!.add(_emotionModel![i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: Text(
          widget.emotionname,
          style: const TextStyle(
              color: AppStyle.darkblue,
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
              color: AppStyle.darkblue,
            )),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: _specific?.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmotionSingle(
                                singleDua: _specific![index],
                              )));
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: AppStyle.paddin),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppStyle.whiteColor,
                    boxShadow: AppStyle.shadow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 33,
                        height: 40,
                        // design
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyle.primaryColor,
                        ),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              color: AppStyle.whiteColor, fontSize: 16),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(_specific![index].title,
                            maxLines: 2,
                            style: const TextStyle(
                                color: AppStyle.darkblue,
                                fontSize: 17,
                                height: 1.5,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
