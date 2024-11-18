import 'package:vmb_portfolio/features/catcher/data/model/CatcherStringsModel.dart';

import '../../../../core/data/values/languages.dart';
import '../../data/values/data_catcher.dart';

abstract class CatcherStringsRepository {
  CatcherStringsModel getCatcherStrings(Languages language);
}