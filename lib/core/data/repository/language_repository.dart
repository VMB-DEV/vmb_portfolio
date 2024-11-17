import 'package:vmb_portfolio/core/data/data_source/local_data_source_language.dart';

import '../values/languages.dart';

class LanguageRepository {
  final LanguageLocalDataSource localDataSource;
  const LanguageRepository({required this.localDataSource});

  Languages getLanguage() {
    return localDataSource.getStoredLanguage();
  }

  void setLanguage(Languages language) {
    localDataSource.setStoredLanguage(language);
  }
}
