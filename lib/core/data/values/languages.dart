enum Languages {
  english,
  french,
  ;
  static String get sharedPreferenceKey => "languages_key";
  static get def => english;
  bool get isFrench => this == french;
  bool get isEnglish => this == english;
}