import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/provider_contact_links.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/state_contact_links.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/data/values/languages.dart';
import '../../../../core/presentation/sizes/sizes.dart';
import '../../../../core/presentation/text/animated_link_widget.dart';
import '../../../catcher/domain/entity/entity_icon_text_link.dart';

class ContactPart extends ConsumerStatefulWidget {
  final Sizes sizes;
  const ContactPart({
    required this.sizes,
    super.key,
  });

  @override
  ConsumerState<ContactPart> createState() => _ContactPartState();
}

class _ContactPartState extends ConsumerState<ContactPart> {
  Sizes get sizes => widget.sizes;
  ContactLinksState get contactState => ref.watch(contactLinkProvider).requireValue;
  Languages get language => ref.watch(languageProvider).requireValue.language.requireValue;

  @override
  Widget build(BuildContext context) {
    return sizes.isCompact ? _compactLayout(ref) : _largeLayout(ref);
  }

  Widget _largeLayout(WidgetRef ref) => Container(
    margin: margin,
    child: Row(
      children: [
        prefix,
        animateLink(contactState.github.requireValue),
        animateLink(contactState.linkedin.requireValue),
        animateLink(contactState.mail.requireValue),
        animateLink(contactState.signal.requireValue),
      ],
    ),
  );

  Widget animateLink(IconTextLinkEntity link) {
    return AnimatedLinkWidget( sizes: widget.sizes, entity: link, );
  }

  Widget _compactLayout(WidgetRef ref) => Container(
    margin: margin,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        marginLink( child: animateLink(contactState.github.requireValue), ),
        marginLink( child: animateLink(contactState.linkedin.requireValue), ),
        marginLink( child: animateLink(contactState.mail.requireValue), ),
        marginLink( child: animateLink(contactState.signal.requireValue), ),
      ],
    ),
  );

  Widget get prefix => Text(
    language.isFrench ? "liens : " : "links : ",
    style: GoogleFonts.rajdhani(
      fontSize: widget.sizes.fonts.medium,
      color: MyColors.visibleText,
    ),
  );

  EdgeInsetsGeometry get margin => widget.sizes.smallMargins.top
      .add(widget.sizes.leftPartMargin)
      .add(widget.sizes.bigMargins.bot)
  ;

  Widget marginLink({required Widget child}) => Container(
    margin: widget.sizes.smallMargins.top,
    child: child,
  );
}
