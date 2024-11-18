sealed class StartupState {
  const StartupState();
}

// class StartupInitial extends StartupState {
//   const StartupInitial();
// }

class StartupLoading extends StartupState {
  const StartupLoading();
}

class StartupComplete extends StartupState {
  const StartupComplete();
}

class StartupError extends StartupState {
  final Object error;
  final StackTrace stackTrace;

  const StartupError(this.error, this.stackTrace);
}
