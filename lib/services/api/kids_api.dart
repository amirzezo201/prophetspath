import 'package:http/http.dart' as http;
import 'package:prophetspath/models/kidsvideos_model.dart';
import 'package:prophetspath/utils/app_style.dart';

class VideoApi {
  Future<List<KidsVideoModel>?> getKidsVideos() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<KidsVideoModel> model = kidsVideoModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
