import '../model/reports_model.dart';

abstract class IReportsService {
  Future<List?> getListCities();
  Future<AddressModel?> getListDistricts(int? id);
  Future<List<Neighborhoods>?> getListNeighborhoods(int? cityId,int? id);
  Future<List<Schools>?> getListSchools(int? cityId,int? id, int neighborhoodId);
}
