import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/header/domain/usecase/use_case_get_resume_link.dart';

class HeaderUrlNotifier extends Notifier<String> {
  final GetResumeUseCase useCase;
  HeaderUrlNotifier({required this.useCase});

  @override
  String build() {
    return useCase.getResumeUlr();
  }
}