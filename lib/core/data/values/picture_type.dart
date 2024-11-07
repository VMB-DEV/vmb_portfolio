enum PictureType {
  github( path: "/pictures/icons/100x100-github-white.png", ),
  linkedin( path: "/pictures/icons/100x100-linkedin-white.png", ),
  firebase( path: "/pictures/icons/200x200-firebase-white.png"),
  robuzzleIcon( path: "/pictures/projects/robuzzle/200x200-robuzzle-icon.png", ),
  robuzzleScreenshot1( path: "/pictures/projects/robuzzle/540x1085-screenshot1.png", ),
  robuzzleScreenshot2( path: "/pictures/projects/robuzzle/540x1085-screenshot2.png", ),
  robuzzleScreenshot3( path: "/pictures/projects/robuzzle/540x1085-screenshot3.png", ),
  blackScreenshot(path: "/pictures/projects/robuzzle/540x1085-black-screenshot.png")
  ;

  final String path;
  const PictureType({required this.path});

  bool get isCatcherIcon => this == github || this == linkedin;
}