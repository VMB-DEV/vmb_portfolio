import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/startup/state_startup.dart';

import 'notifier_startup.dart';

final startupProvider = NotifierProvider<StartupNotifier, StartupState>(StartupNotifier.new);
