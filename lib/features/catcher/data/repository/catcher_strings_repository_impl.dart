import 'package:vmb_portfolio/core/data/values/languages.dart';
import 'package:vmb_portfolio/features/catcher/data/data_source/local_data_source_catcher.dart';
import 'package:vmb_portfolio/features/catcher/data/model/CatcherStringsModel.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_strings_repository.dart';

class CatcherStringsRepositoryImpl extends CatcherStringsRepository {
  final CatcherLocalDataSource dataSource;
  CatcherStringsRepositoryImpl({required this.dataSource});

  @override
  CatcherStringsModel getCatcherStrings(Languages language) {
    final data = dataSource.getData();

    return CatcherStringsModel(
      threeLinesPresentation: data.threeLinesPresentation[language]!,
      mainTechno: data.mainTechno[language]!,
      linkPrefix: data.linkPrefix[language]!,
      specialisation: data.specialisation,
      description: data.description[language]!,
      descriptionButton: data.descriptionButton[language]!,
    );
  }
}