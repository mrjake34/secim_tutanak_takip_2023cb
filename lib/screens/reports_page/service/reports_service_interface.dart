import '../model/reports_model.dart';

abstract class IReportsService {
  Future<List?> getListCities();
  Future<AddressModel?> getListDistricts(int? id);
}
