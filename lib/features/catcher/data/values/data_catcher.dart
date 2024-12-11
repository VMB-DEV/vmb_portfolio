import 'package:vmb_portfolio/core/data/values/languages.dart';

class CatcherData {
  final Map<Languages, String> threeLinesPresentation = {
    Languages.english: "Hello,\nI'm Valentin.\nthe application developper\nyou need.",
    Languages.french: "Bonjour,\nmoi c'est Valentin.\nLe développeur d'applications\nqu'il vous manque.",
  };

  final Map<Languages, String> mainTechno = {
    Languages.english: "Main languages : Dart  -  Kotlin  -  JavaScript  -  Python  -  C",
    Languages.french: "Principaux languages : Dart  -  Kotlin  -  JavaScript  -  Python  -  C",
  };

  final Map<Languages, String> linkPrefix = {
    Languages.english: "Find me here : ",
    Languages.french: "Retrouvez moi ici : ",
  };

  final Map<Languages, String> descriptionButton = {
    Languages.english: "  learn more about myself  ",
    Languages.french: "  pour en savoir plus  ",
  };

  final Map<Languages, String> description = {
    Languages.english: "Currently studying at Yutopia school in Paris, i've always been passionnate by technology."
        " I started learning software developpement with the good old C language on a vim setup. Then i discovered Java, Kotlin,"
        " Dart alongside JavaScript, Lua and Python.\n"
        "I enjoy working on Jetbrains IDE enhanced with Ideavim plugin for blazzingly fast text edition when i implement structured"
        "architectures. I enjoy making an effort to code clean to make my code more testable. The idea begin is to always write code easy to modigy or upgrade"
        "I'm looking forward to ear from you so do not hesitate and let's get in touch!"
    ,
    Languages.french: "Actuellement étudiant chez Yutopia à Paris dans le 11ème, j'ai toujours été passionné par la technologie."
        " J'ai commencé à coder avec le bon vieux C et Vim. J'ai ensuite découvert Java, Kotlin, Dart à côté du JavaScript, Lua ou Python.\n"
        "J'aime particulièrement utiliser les IDE JetBrains avec le plugin Ideavim pour éditer au plus vite mon code."
        " Je m'efforce à structurer et coder proprement pour rendre mon application la plus facilement testable et modifiable."
        " J'attends avec impatience d'entendre de vos nouvelles alors n'hesitez pas à me contacter!"
    ,
  };

  final String specialisation = "Mobile  /  Web  /  Crossplatform  /  Full Stack developper";
}