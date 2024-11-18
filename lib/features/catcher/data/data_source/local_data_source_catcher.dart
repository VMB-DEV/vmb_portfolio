import 'package:vmb_portfolio/features/catcher/data/values/data_catcher.dart';

abstract class CatcherLocalDataSource {
  CatcherData getData();
}

class CatcherLocalDataSourceImpl extends CatcherLocalDataSource {
  @override
  CatcherData getData() {
    return CatcherData();
  }
}