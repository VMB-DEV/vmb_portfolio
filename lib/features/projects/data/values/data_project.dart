import 'package:vmb_portfolio/core/data/values/picture_type.dart';

enum ProjectData {
  portfolio(
    concept: "presenting my self in a interactive way",
    description: "",
    techno:  "Dart Flutter",
    icon: PictureType.robuzzleIcon,
    assets: [
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
    ],
  ),
  robuzzle(
    concept: "play with Algorithms in space",
    description: "",
    techno:  "Dart Flutter",
    icon: PictureType.robuzzleIcon,
    assets: [
      PictureType.robuzzleScreenshot1,
      PictureType.robuzzleScreenshot2,
      PictureType.robuzzleScreenshot3,
    ],
  ),
  snake(
    concept: "local multiplayer mythical snake game",
    description: "",
    techno:  "Python Pygame Pygbag",
    icon: PictureType.robuzzleIcon,
    assets: [
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
    ],
  ),
  spacewars(
    concept: "wifi multiplayer space shooter",
    description: "",
    techno:  "Kotlin",
    icon: PictureType.robuzzleIcon,
    assets: [
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
      PictureType.blackScreenshot,
    ],
  ),
  ;
  final String concept;
  final String description;
  final String techno;
  final PictureType icon;
  final List<PictureType> assets;
  const ProjectData({
    required this.concept,
    required this.description,
    required this.techno,
    required this.icon,
    required this.assets,
  });
}