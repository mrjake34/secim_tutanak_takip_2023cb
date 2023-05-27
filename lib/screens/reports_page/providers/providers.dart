import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/city_model.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/district_model.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/neighborhood_model.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/schools_model.dart';
import '../../../base/service/translation/locale_keys.g.dart';


class SearchStringValueProvider extends ChangeNotifier {
  String _searchTerm = "";

  String get getSearchTerm => _searchTerm;

  set setSearchTerm(String value) {
    _searchTerm = value;
    notifyListeners();
  }
}

class ChooseCityProvider extends ChangeNotifier {
  CityModel _city =
      CityModel(id: 0, name: LocaleKeys.mainText_chooseCity.tr());

  CityModel get getCityValue => _city;

  set setCityValue(CityModel value) {
    _city = value;
    notifyListeners();
  }
}

class ChooseDistrictProvider extends ChangeNotifier {
  DistrictModel _district =
      DistrictModel(districtId: 0, districtName: LocaleKeys.mainText_chooseDistrict.tr());
  List<DistrictModel> _districtList = [];

  DistrictModel get getDistrictValue => _district;
  List<DistrictModel> get getDistrictList => _districtList;

  set setDistrictList(List<DistrictModel> value) {
    _districtList = value;
    notifyListeners();
  }

  set setDistrictValue(DistrictModel value) {
    _district = value;
    notifyListeners();
  }
}

class ChooseNeighborhoodProvider extends ChangeNotifier {
  NeighborhoodModel _neighborhood =
      NeighborhoodModel(neighborId: 0, neighborName: LocaleKeys.mainText_chooseNeighborhood.tr());
  List _neightborhoodList = [];

  List get getNeightborhoodList => _neightborhoodList;
  NeighborhoodModel get getNeighborhoodValue => _neighborhood;

  set setNeightborhoodList(List value) {
    _neightborhoodList = value;
    notifyListeners();
  }

  set setNeightborhoodValue(NeighborhoodModel value) {
    _neighborhood = value;
    notifyListeners();
  }
}

class ChooseSchoolProvider extends ChangeNotifier {
  SchoolsModel _school =
      SchoolsModel(name: LocaleKeys.mainText_chooseSchool.tr());
  List _schoolList = [];

  List get getSchoolList => _schoolList;
  SchoolsModel get getSchoolValue => _school;

  set setSchoolList(List value) {
    _schoolList = value;
    notifyListeners();
  }

  set setSchoolValue(SchoolsModel value) {
    _school = value;
    notifyListeners();
  }
}
