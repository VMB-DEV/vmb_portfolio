import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/core/data/values/url_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/entity/entity_icon_text_link.dart';
import 'package:vmb_portfolio/features/contact/domain/repository/repository_contact_link.dart';

class GetContactLinksUseCase {
  final ContactLinksRepository repo;

  GetContactLinksUseCase({required this.repo});

  Future<IconTextLinkEntity> get getMailLink async => IconTextLinkEntity.from(
    UrlType.myMail,
    await repo.getContactLinks(PictureType.mail),
  );
  Future<IconTextLinkEntity> get getLinkedin async => IconTextLinkEntity.from(
    UrlType.myLinkedin,
    await repo.getContactLinks(PictureType.linkedin),
  );
  Future<IconTextLinkEntity> get getGithubLink async => IconTextLinkEntity.from(
    UrlType.myGithub,
    await repo.getContactLinks(PictureType.github),
  );
}