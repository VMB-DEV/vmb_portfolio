import 'package:vmb_portfolio/core/data/values/url_type.dart';
import 'package:vmb_portfolio/features/header/domain/repository/header_url_repository.dart';

class GetResumeUseCase {
  HeaderUrlRepository headerUrlRepository;
  GetResumeUseCase({required this.headerUrlRepository});
  String getResumeUlr() => headerUrlRepository.getResume().urlString;
}