import 'package:flutter/services.dart';
import 'package:prophetspath/models/explore_hadith.dart';
import 'package:prophetspath/models/explore_model.dart';

class ExploreService {
  Future<List<Explore>?> getExploredata() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/explore.json');
      List<Explore> exploreList = exploreFromJson(response);
      return exploreList;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<ExploreHadith>?> getExplorehadith() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/explore_hadith.json');
      List<ExploreHadith> explorHadithList = exploreHadithFromJson(response);
      return explorHadithList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
