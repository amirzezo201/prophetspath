import 'package:flutter/services.dart';
import 'package:prophetspath/models/duamodel.dart';

class DuaService {
  Future<List<DuaModel>?> getdua() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/dua.json');
      List<DuaModel> duaList = duaModelFromJson(response);
      return duaList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
