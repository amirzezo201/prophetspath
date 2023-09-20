import 'package:flutter/material.dart';
import 'package:prophetspath/models/explore_hadith.dart';
import 'package:prophetspath/models/explore_model.dart';
import 'package:prophetspath/services/api/explore_api.dart';
import 'package:prophetspath/utils/app_style.dart';

class ExploreHadithScreen extends StatefulWidget {
  const ExploreHadithScreen({
    super.key,
    required this.explorecategory,
  });
  final String explorecategory;

  @override
  State<ExploreHadithScreen> createState() => _ExploreHadithScreenState();
}

class _ExploreHadithScreenState extends State<ExploreHadithScreen> {
  List<ExploreHadith> _exploreHadithModel = [];

  late List<ExploreHadith> _specificHadith = [];
  @override
  Future getExploreHadith() async {
    _exploreHadithModel = (await ExploreService().getExplorehadith())!;
    for (int i = 0; i < _exploreHadithModel.length; i++) {
      if (_exploreHadithModel[i].category == widget.explorecategory) {
        _specificHadith.add(_exploreHadithModel[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      body: FutureBuilder(
        future: getExploreHadith(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Padding(
            padding: const EdgeInsets.all(AppStyle.paddin),
            child: ListView.builder(
              itemCount: _specificHadith.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: AppStyle.shadow,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
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
                            child: Text(_specificHadith[index].text.toString(),
                                style: TextStyle(
                                    height: 2,
                                    color: AppStyle.darkblue,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          _specificHadith[index].refrence.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
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
