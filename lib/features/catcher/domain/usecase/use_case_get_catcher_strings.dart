import 'package:vmb_portfolio/features/catcher/domain/entity/entity_catcher_strings.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_strings_repository.dart';

import '../../../../core/data/values/languages.dart';

class GetCatcherStringsUseCase {
  CatcherStringsRepository repository;

  GetCatcherStringsUseCase({required this.repository});

  CatcherStringsEntity call({required Languages language}) => CatcherStringsEntity.from(model: repository.getCatcherStrings(language));
}