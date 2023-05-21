import 'package:flutter_test/flutter_test.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/reports_service.dart';

void main() {
  late ReportsService service;

  setUp(() {
    service = ReportsService();
  });

  test('Cities Fetch Test', () async {
    final response = await service.getListCities();

    expect(
      response,
      Matcher,
    );
  });
}
