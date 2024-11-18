import 'package:vmb_portfolio/core/data/values/languages.dart';

class CatcherData {
  final Map<Languages, String> threeLinesPresentation = {
    Languages.english: "Hello,\nI'm Valentin.\nthe application developper\nyou need.",
    Languages.french: "Bonjours,\nMoi c'est Valentin.\nLe développeur d'applications\nqu'il vous manque.",
  };

  final Map<Languages, String> mainTechno = {
    Languages.english: "Main techno : Dart  -  Kotlin  -  JavaScript  -  Python  -  C",
    Languages.french: "Principales technos: Dart  -  Kotlin  -  JavaScript  -  Python  -  C",
  };

  final Map<Languages, String> linkPrefix = {
    Languages.english: "Find me here : ",
    Languages.french: "Retrouvez moi ici : ",
  };
}