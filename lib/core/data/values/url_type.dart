enum UrlType {
  github(
    text: "github",
    urlString: "https://github.com/VMB-DEV",
  ),
  linkedin(
    text: "linkedin",
    urlString: "https://www.linkedin.com/in/valentin-m-386653186/",
  ),
  myResume(
    text: "resume",
    urlString: "https://drive.google.com/file/d/1d8ztqqHf4nYo_Ie-TARK3uFLzZGJK0f0/view?usp=sharing",
  ),
  myGithub(
    text: "github.com/VMB-DEV",
    urlString: "https://github.com/VMB-DEV",
  ),
  myLinkedin(
    text: "Valentin Marchet Le Bouteilliec",
    urlString: "https://www.linkedin.com/in/valentin-m-386653186/",
  ),
  myMail(
    text: "write me a mail",
    urlString: "mailto:cv2110.cut990@passmail.net",
  ),
  portfolioHosted(
    text: "firebase-web-app",
    urlString: "http://robuzzle-web.web.app",
  ),
  portfolioGithub(
    text: "VMB-DEV/vmb_portfolio",
    urlString: "https://github.com/VMB-DEV/vmb_portfolio",
  ),
  robuzzleGithub(
    text: "VMB-DEV/robuzzle",
    urlString: "https://github.com/VMB-DEV/robuzzle",
  ),
  robuzzleHosted(
    text: "firebase-web-app",
    urlString: "http://robuzzle-web.web.app",
  ),
  robuzzleGooglePlay(
    text: "coming soon...",
    urlString: "",
  ),
  snakeGithub(
    text: "VMB-DEV/snake_multi",
    urlString: "https://github.com/VMB-DEV/snake_multi",
  ),
  snakeHosted(
    text: "github-web-app",
    urlString: "https://vmb-dev.github.io/snake_multi/",
  ),
  ;

  final String urlString;
  final String text;

  const UrlType({
    required this.urlString,
    required this.text,
  });
}