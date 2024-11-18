import 'package:vmb_portfolio/core/data/values/languages.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/core/data/values/url_type.dart';

enum ProjectData {
  portfolio(
    concept: {
      Languages.english: "Web application made to present my self in a interactive way. Designs are inspired by Cobinna David's and Saxena Sakshi's work.",
      Languages.french: "Application web pour me présenter de manière interactive. Directement inspiré du travail de David Cobinna et Saxena Sakshi."
    },
    description: {
      Languages.english: "This Web application is deployed with firebase. Built with the Flutter framework, this project has been built with usefull packages like flutter_riverpod (or google_fonts). The main idea was to work in a clean architecture to make a maintainable portfolio and easily upgradable",
      Languages.french: "Cette application web est déployé grâce à firebase et est développée en Dart avec Flutter. Ce projet utilise des packets très utiles comme flutter_riverpod ou encore google_fonts. L'idée derrière ce portfolio est de mettre en oeuvre une architecture structurée permettant de tester les differentes couches afin de faciliter les amélioration et/ou modification",
    },
    techno:  "Dart, Flutter, Riverpod",
    icon: PictureType.portfolioIcon,
    assets: [
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
    ],
    links: [
      (PictureType.github, UrlType.portfolioGithub),
      (PictureType.firebase, UrlType.portfolioGithub)
    ],
  ),
  robuzzle(
    concept: {
      Languages.english: "Web and Mobile game application. The main purpose of the game is to conceive algorithms to instruct a space ship on how to get all the stars on a map.",
      Languages.french: "Application web et mobile. Le jeu se base sur une logique algorithmique de déplacements conditionnés pour résoudre un puzzle en récupérant toutes les étoiles affichées."
    },
    description: {
      Languages.english: "This application deployed with firebase has been build with Dart on the Flutter framework. The project in developed in a clean architecture /[feature, core]/[data, domain, presentation]. I choosed BLoC for state management.",
      Languages.french: "Cette application est déployé grâce à firebase et est développé en Dart avec le framework Flutter. Le projet est structuré de la manière suiviant /[feature, core]/[data, domain, presentation]. J'ai choisi BLoC pour la gestion d'états.",
    },
    techno:  "Dart, Flutter, BLoC, Hive",
    icon: PictureType.robuzzleIcon,
    assets: [
      PictureType.robuzzleScreenshot1,
      PictureType.robuzzleScreenshot2,
      PictureType.robuzzleScreenshot3,
    ],
    links: [
      (PictureType.github, UrlType.robuzzleGithub),
      (PictureType.firebase, UrlType.robuzzleHosted),
      (PictureType.playstore, UrlType.robuzzleGooglePlay),
    ],
  ),
  snake(
    concept: {
      Languages.english: "Web and desktop application. Classical snake game with a local multiplayer option.",
      Languages.french: "Application web et de bureau. Un snake des plus classique jouable à deux en local",
    },
    description: {
      Languages.english: "Game developed at the end of a 2 weeks bootcamp on python in Yutopia. Mainly used the Pygame engine to run it and a structured architecture for an easy maintenance. Hosted on the github service.",
      Languages.french: "Jeu développé à la fin d'un bootcamp python chez Yutopia. Le moteur du jeu utilise Pygame et l'architecture choisie est basique, elle divise le jeu en plusieurs écran et utilise des éléments modulaires pour simplifier la maintenance. Héberger grâce à Github.",
    },
    // description: "Game developed at the end of a 2 weeks bootcamp on python in Yutopia. Mainly used the pygame engine to run it and a structured architecture for an easy maintenance. Hosted on the github service.",
    techno:  "Python, Pygame, Pygbag",
    icon: PictureType.snakeIcon,
    assets: [
      PictureType.snakeScreenshot1,
      PictureType.snakeScreenshot2,
      PictureType.snakeScreenshot3,
    ],
    links: [
      (PictureType.github, UrlType.snakeGithub),
      (PictureType.github, UrlType.snakeHosted),
    ],
  ),
  spacewars(
    concept: {
      Languages.english: "Android native mobile game application. The main purpose is to shoot the local adversary in front.",
      Languages.french: "Application mobile native android. Inspiré de DUAL, le jeu a pour but est de détruire le vaisseau adverse connecté en wifi",
    },
    description: {
      Languages.english: "Game developed in Kotlin with the Jetpack toolkit and flows to handle events. Two devices facing each other connected through wifi",
      Languages.french: "Jeu développé en Kotlin avec Jetpack compose pour l'UI et Kotlin flows pour la gestion des évenments en MVVM. Les deux smartphones communique en réseau local via le Wifi",
    },
    techno:  "Kotlin, Jetpack, Compose",
    icon: PictureType.spaceWarsIcon,
    assets: [
      PictureType.spaceWarsScreenshot1,
      PictureType.spaceWarsScreenshot2,
      PictureType.spaceWarsScreenshot3,
    ],
    links: [],
  ),
  ;
  final Map<Languages, String> concept;
  final Map<Languages, String> description;
  final String techno;
  final PictureType icon;
  final List<PictureType> assets;
  final List<(PictureType, UrlType)> links;
  const ProjectData({
    required this.concept,
    required this.description,
    required this.techno,
    required this.icon,
    required this.assets,
    required this.links,
  });
}