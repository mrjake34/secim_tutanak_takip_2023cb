import 'package:flutter/material.dart';

class TranslationManager {
  TranslationManager._init();
  static TranslationManager? _instance;
  static TranslationManager? get instance {
    _instance ??= TranslationManager._init();
    return _instance;
  }

  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [trLocale];
}
