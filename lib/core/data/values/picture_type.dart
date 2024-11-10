enum PictureType {
  github( path: "/pictures/icons/100x100-github-white.png", ),
  linkedin( path: "/pictures/icons/100x100-linkedin-white.png", ),
  firebase( path: "/pictures/icons/200x200-firebase-white.png"),
  playstore( path: "/pictures/icons/512x512-playstore.png"),
  blackScreenshot(path: "/pictures/projects/540x1085-black-screenshot.png"),
  portfolioIcon(path: "/pictures/projects/portfolio/512x512-face.jpeg"),
  robuzzleIcon( path: "/pictures/projects/robuzzle/200x200-robuzzle-icon.png", ),
  robuzzleScreenshot1( path: "/pictures/projects/robuzzle/540x1085-screenshot1.png", ),
  robuzzleScreenshot2( path: "/pictures/projects/robuzzle/540x1085-screenshot2.png", ),
  robuzzleScreenshot3( path: "/pictures/projects/robuzzle/540x1085-screenshot3.png", ),
  snakeIcon( path: "/pictures/projects/snake/512x512-snake-icon.png"),
  snakeScreenshot1( path: "/pictures/projects/snake/screenshot1.png", ),
  snakeScreenshot2( path: "/pictures/projects/snake/screenshot2.png", ),
  snakeScreenshot3( path: "/pictures/projects/snake/screenshot3.png", ),
  spaceWarsIcon( path: "/pictures/projects/spacewars/512x512-spacewars-icon.png"),
  spaceWarsScreenshot1( path: "/pictures/projects/spacewars/screenshot1.png"),
  spaceWarsScreenshot2( path: "/pictures/projects/spacewars/screenshot2.png"),
  spaceWarsScreenshot3( path: "/pictures/projects/spacewars/screenshot3.png"),
  ;

  final String path;
  const PictureType({required this.path});

  bool get isCatcherIcon => this == github || this == linkedin;
}