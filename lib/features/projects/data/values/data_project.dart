import 'package:vmb_portfolio/core/data/values/languages.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/core/data/values/url_type.dart';

enum ProjectData {
  portfolio(
    concept: {
      Languages.english: "Web application made to present my self in a interactive way. Designs are inspired by Cobinna David's and Saxena Sakshi's work.",
      Languages.french: "Application web pour me présenter de manière interactive. Directement inspiré du travail de David Cobinna et Saxena Sakshi."
    },
    description: "This Web application is deployed with firebase. Built with the Flutter framework, this project has been built with usefull packages like flutter_riverpod (or google_fonts). The main idea was to work in a clean architecture to make a maintainable portfolio and easily upgradable",
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
    description: "This application deployed with firebase has been build with Dart on the Flutter framework. The project use ",
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
    description: "Game developed at the end of a 2 weeks bootcamp on python in Yutopia. Mainly used the pygame engine to run it and a structured architecture for an easy maintenance. Hosted on the github service.",
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
    description: "Game developed in Kotlin with the Jetpack toolkit and flows to handle events. Two devices facing each other connected through wifi",
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
  final String description;
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