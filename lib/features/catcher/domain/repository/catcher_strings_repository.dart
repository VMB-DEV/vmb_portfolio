import 'package:vmb_portfolio/features/catcher/data/model/CatcherStringsModel.dart';
import '../../../../core/data/values/languages.dart';

abstract class CatcherStringsRepository {
  CatcherStringsModel getCatcherStrings(Languages language);
}