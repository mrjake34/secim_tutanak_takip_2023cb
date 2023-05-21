import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../base/service/translation/locale_keys.g.dart';

import '../model/reports_model.dart';

class SearchStringValueProvider extends ChangeNotifier {
  String _searchTerm = "";

  String get getSearchTerm => _searchTerm;

  set setSearchTerm(String value) {
    _searchTerm = value;
    notifyListeners();
  }
}

class ChooseCityProvider extends ChangeNotifier {
  AddressModel _city =
      AddressModel(id: 0, name: LocaleKeys.mainText_chooseCity.tr());

  AddressModel get getCityValue => _city;

  set setCityValue(AddressModel value) {
    _city = value;
    notifyListeners();
  }
}

class ChooseDistrictProvider extends ChangeNotifier {
  Districts _district =
      Districts(id: 0, name: LocaleKeys.mainText_chooseDistrict.tr());
  List<Districts> _districtList = [];

  Districts get getDistrictValue => _district;
  List<Districts> get getDistrictList => _districtList;

  set setDistrictList(List<Districts> value) {
    _districtList = value;
    notifyListeners();
  }

  set setDistrictValue(Districts value) {
    _district = value;
    notifyListeners();
  }
}

class ChooseNeighborhoodProvider extends ChangeNotifier {
  AddressModel _neighborhood =
      AddressModel(id: 0, name: LocaleKeys.mainText_chooseNeighborhood.tr());
  List _neightborhoodList = [];

  List get getNeightborhoodList => _neightborhoodList;
  AddressModel get getNeighborhoodValue => _neighborhood;

  set setNeightborhoodList(List value) {
    _neightborhoodList = value;
    notifyListeners();
  }

  set setNeightborhoodValue(AddressModel value) {
    _neighborhood = value;
    notifyListeners();
  }
}

class ChooseSchoolProvider extends ChangeNotifier {
  AddressModel _school =
      AddressModel(id: 0, name: LocaleKeys.mainText_chooseSchool.tr());
  List _schoolList = [];

  List get getSchoolList => _schoolList;
  AddressModel get getSchoolValue => _school;

  set setSchoolList(List value) {
    _schoolList = value;
    notifyListeners();
  }

  set setSchoolValue(AddressModel value) {
    _school = value;
    notifyListeners();
  }
}
