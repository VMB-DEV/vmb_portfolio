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
  slidingIconKtor(path: "/pictures/catcher/512x512-sliding-ktor.png"),
  slidingIconKtor2(path: "/pictures/catcher/512x512-sliding-ktor2.png"),
  slideAndroidStudio(path: "/pictures/catcher/slide-android-studio.png"),
  slideBash(path: "/pictures/catcher/slide-bash.png"),
  slideC(path: "/pictures/catcher/slide-c.png"),
  slideDart(path: "/pictures/catcher/slide-dart.png"),
  slideDebian(path: "/pictures/catcher/slide-debian.png"),
  slideFirebase(path: "/pictures/catcher/slide-firebase.png"),
  slideFlutter(path: "/pictures/catcher/slide-flutter.png"),
  slideGithub(path: "/pictures/catcher/slide-github.png"),
  slideIdeaVim(path: "/pictures/catcher/slide-ideavim.png"),
  slideIntellij(path: "/pictures/catcher/slide-intellij.png"),
  slideJetBrains(path: "/pictures/catcher/slide-jetbrains.png"),
  slideJetBrainsToolbox(path: "/pictures/catcher/slide-jetbrains-toolbox.png"),
  slideJS(path: "/pictures/catcher/slide-js.png"),
  slideKtor(path: "/pictures/catcher/slide-ktor.png"),
  slideLua(path: "/pictures/catcher/slide-lua.png"),
  slideNeoVim(path: "/pictures/catcher/slide-neovim.png"),
  slidePlayStore(path: "/pictures/catcher/slide-playstore.png"),
  slidePyCharm(path: "/pictures/catcher/slide-pycharm.png"),
  slidePython(path: "/pictures/catcher/slide-python.png"),
  slideSignal(path: "/pictures/catcher/slide-signal.png"),
  slideUbuntu(path: "/pictures/catcher/slide-ubuntu.png"),
  slideVivaldi(path: "/pictures/catcher/slide-vivaldi.png"),
  ;

  final String path;
  const PictureType({required this.path});

  bool get isCatcherIcon => this == github || this == linkedin;
  static List<PictureType> get slidingIcons => [
    slideAndroidStudio,
    slideBash,
    slideC,
    slideDart,
    slideDebian,
    slideFirebase,
    slideFlutter,
    slideGithub,
    slideIdeaVim,
    slideIntellij,
    slideJetBrains,
    slideJetBrainsToolbox,
    slideJS,
    slideKtor,
    slideLua,
    slideNeoVim,
    slidePlayStore,
    slidePyCharm,
    slidePython,
    slideSignal,
    slideUbuntu,
    slideVivaldi,
  ];
}