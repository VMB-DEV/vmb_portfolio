import '../../../../core/data/values/languages.dart';

enum PartEntity {
  home(
    {
      Languages.english : "home",
      Languages.french : "accueil",
    },
  ),
  projects(
    {
      Languages.english : "projects",
      Languages.french : "projets",
    },
  ),
  contact(
    {
      Languages.english : "contact",
      Languages.french : "contact",
    },
  ),
  resume(
    {
      Languages.english : "resume",
      Languages.french : "cv",
    },
  ),
  language(
    {
      Languages.english : "language",
      Languages.french : "language",
    },
  ),
  ;

  final Map<Languages, String> text;
  const PartEntity(this.text);
  // static List<String> get names => values.map((type) => type.name).toList();
  static List<String> names(Languages type) => values.map((map) => map.text[type]!).toList();
}