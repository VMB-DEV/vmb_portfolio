import 'package:vmb_portfolio/features/catcher/data/model/CatcherStringsModel.dart';

class CatcherStringsEntity {
  final String threeLinesPresentation;
  final String mainTechno;
  final String linkPrefix;
  final String specialisation;
  final String description;
  final String descriptionButton;

  CatcherStringsEntity({
    required this.threeLinesPresentation,
    required this.mainTechno,
    required this.linkPrefix,
    required this.specialisation,
    required this.description,
    required this.descriptionButton,
  });

  factory CatcherStringsEntity.from({required CatcherStringsModel model}) {
    return CatcherStringsEntity(
      threeLinesPresentation: model.threeLinesPresentation,
      mainTechno: model.mainTechno,
      linkPrefix: model.linkPrefix,
      specialisation: model.specialisation,
      description: model.description,
      descriptionButton: model.descriptionButton,
    );
  }
}