// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class IBallotBoxService {
  Future<List?> fetchBallotBoxes(int? schoolsId);
}
