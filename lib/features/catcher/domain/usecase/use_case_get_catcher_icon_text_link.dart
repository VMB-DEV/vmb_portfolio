import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/entity/entity_icon_text_link.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_urls_repository.dart';

class GetCatcherIconTextLinkUseCase {
  CatcherUrlsRepository catcherUrlsRepository;
  CatcherIconsRepository catcherIconsRepository;
  GetCatcherIconTextLinkUseCase({
    required this.catcherUrlsRepository,
    required this.catcherIconsRepository,
  });

  Future<IconTextLinkEntity> github() async => IconTextLinkEntity.from(
    catcherUrlsRepository.getMyGithub(),
    await catcherIconsRepository.getCatcherImage(PictureType.github),
  );
  Future<IconTextLinkEntity> linkedin() async => IconTextLinkEntity.from(
    catcherUrlsRepository.getMyLinkedin(),
    await catcherIconsRepository.getCatcherImage(PictureType.linkedin),
  );
}