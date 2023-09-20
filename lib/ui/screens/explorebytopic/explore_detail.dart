import 'package:flutter/material.dart';
import 'package:prophetspath/models/explore_model.dart';
import 'package:prophetspath/services/api/explore_api.dart';
import 'package:prophetspath/utils/app_style.dart';

class ExploreQuran extends StatefulWidget {
  const ExploreQuran({
    super.key,
    required this.explorecategory,
  });
  final String explorecategory;

  @override
  State<ExploreQuran> createState() => _ExploreQuranState();
}

class _ExploreQuranState extends State<ExploreQuran> {
  List<Explore> _exploreModel = [];

  late List<Explore> _specific = [];
  @override
  Future getExplore() async {
    _exploreModel = (await ExploreService().getExploredata())!;
    for (int i = 0; i < _exploreModel.length; i++) {
      if (_exploreModel[i].category == widget.explorecategory) {
        _specific.add(_exploreModel[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      body: FutureBuilder(
        future: getExplore(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Padding(
            padding: const EdgeInsets.all(AppStyle.paddin),
            child: ListView.builder(
              itemCount: _specific.length,
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
                            child: Text(_specific[index].arabic,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    height: 2,
                                    color: AppStyle.primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.060,
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
                          _specific[index].english,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          _specific[index].refrence,
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
