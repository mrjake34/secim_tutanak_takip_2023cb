import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/address_model.dart';

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
  AddressModel _district =
      AddressModel(id: 0, name: LocaleKeys.mainText_chooseDistrict.tr());
  List _districtList = [];

  AddressModel get getDistrictValue => _district;
  List get getDistrictList => _districtList;

  set setDistrictList(List value) {
    _districtList = value;
    notifyListeners();
  }

  set setDistrictValue(AddressModel value) {
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
