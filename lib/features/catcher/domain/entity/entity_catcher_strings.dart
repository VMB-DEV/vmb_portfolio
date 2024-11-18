import 'package:vmb_portfolio/features/catcher/data/model/CatcherStringsModel.dart';

class CatcherStringsEntity {
  final String threeLinesPresentation;
  final String mainTechno;
  final String linkPrefix;

  CatcherStringsEntity({
    required this.threeLinesPresentation,
    required this.mainTechno,
    required this.linkPrefix,
  });

  factory CatcherStringsEntity.from({required CatcherStringsModel model}) {
    return CatcherStringsEntity(
      threeLinesPresentation: model.threeLinesPresentation,
      mainTechno: model.mainTechno,
      linkPrefix: model.linkPrefix,
    );
  }
}