import 'package:dio/dio.dart';

import 'ballotbox_service_interface.dart';

class BallotBoxService extends IBallotBoxService {
  Dio dio = Dio();
  @override
  Future<List?> fetchBallotBoxes(int? schoolsId) async {
    if (schoolsId == null) return null;
    final response = await dio.get(
      "https://api-sonuc.oyveotesi.org/api/v1/submission/school/$schoolsId",
    );

    if (response.statusCode == 200) {
      List? boxes = response.data;
      return boxes;
    }
    return null;

    // String jsonString =
    //     await rootBundle.loadString('assets/json/ballotbox_test.json');
    // List cities = json.decode(jsonString);

    // return cities;
  }
}
