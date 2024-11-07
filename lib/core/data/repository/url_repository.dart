import 'package:vmb_portfolio/core/data/values/url_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_urls_repository.dart';
import 'package:vmb_portfolio/features/header/domain/repository/header_url_repository.dart';

class UrlRepository with CatcherUrlsRepository, HeaderUrlRepository {
  @override
  UrlType getMyGithub() {
    return UrlType.myGithub;
  }

  @override
  UrlType getMyLinkedin() {
    return UrlType.myLinkedin;
  }

  @override
  UrlType getResume() {
    return UrlType.myResume;
  }
}