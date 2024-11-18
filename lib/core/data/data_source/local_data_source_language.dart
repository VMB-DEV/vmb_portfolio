import 'package:shared_preferences/shared_preferences.dart';

import '../values/languages.dart';

abstract class LanguageLocalDataSource {
  Languages getStoredLanguage();
  void setStoredLanguage(Languages language);
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;
  LanguageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Languages getStoredLanguage() {
    final String storedName = sharedPreferences.getString(Languages.sharedPreferenceKey) ?? Languages.english.name;
    return Languages.values.singleWhere((language) => language.name == storedName, orElse: () => Languages.english,);
  }

  @override
  void setStoredLanguage(Languages language) {
    sharedPreferences.setString(Languages.sharedPreferenceKey, language.name);
  }
}