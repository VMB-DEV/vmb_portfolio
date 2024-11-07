enum UrlType {
  myGithub(
    text: "github",
    urlString: "https://github.com/VMB-DEV",
  ),
  myLinkedin(
    text: "linkedin",
    urlString: "https://www.linkedin.com/in/valentin-m-386653186/",
  ),
  myResume(
    text: "resume",
    urlString: "https://drive.google.com/file/d/1d8ztqqHf4nYo_Ie-TARK3uFLzZGJK0f0/view?usp=sharing",
  ),
  robuzzleGithub(
    text: "VMB-DEV/robuzzle",
    urlString: "https://github.com/VMB-DEV/robuzzle",
  ),
  robuzzleHosted(
    text: "web.app",
    urlString: "http://robuzzle-web.web.app",
  ),

  ;

  final String urlString;
  final String text;

  const UrlType({
    required this.urlString,
    required this.text,
  });
}