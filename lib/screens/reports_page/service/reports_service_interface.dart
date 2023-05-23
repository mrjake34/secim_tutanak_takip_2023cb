
abstract class IReportsService {
  Future<List?> getListCities();
  Future<List?> getListDistricts(int? id);
  Future<List?> getListNeighborhoods(int? districtId, int? id);
  Future<List?> getListSchools(int? cityId, int? districtId, int? neighborhoodId);
}
