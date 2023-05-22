import 'dart:convert';

import 'package:flutter/services.dart';

import 'ballotbox_service_interface.dart';

class BallotBoxService extends IBallotBoxService {
  @override
  Future fetchBallotBoxes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/ballotbox_test.json');
    List cities = json.decode(jsonString);

    return cities;
  }
}
