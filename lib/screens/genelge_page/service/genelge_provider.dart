import 'package:flutter/material.dart';

class SearchBarProviderGenelge extends ChangeNotifier {
  String searchTerm = "";

  String get getSearchTerm => searchTerm;

  set setSearchTerm(String value) {
    searchTerm = value;
    notifyListeners();
  }
}
