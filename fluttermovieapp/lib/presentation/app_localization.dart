import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermovieapp/common/constants/languages.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

 static AppLocalization? of(context) => 
    Localizations.of<AppLocalization>(context, AppLocalization);


  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {

  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return Languages.languages
                    .map((e) => e.code)
                    .toList()
                    .contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
  
}