import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/provider_contact_links.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/presentation/sizes/sizes.dart';
import '../../../../core/presentation/text/animated_link_widget.dart';

class ContactPart extends ConsumerWidget {
  final Sizes sizes;
  const ContactPart({
    required this.sizes,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return sizes.isCompact ? _compactLayout(ref) : _largeLayout(ref);
  }

  Widget _largeLayout(WidgetRef ref) => Container(
    margin: margin,
    child: Row(
      children: [
        prefix,
        AnimatedLinkWidget(
          sizes: sizes,
          entity: ref.watch(contactLinkProvider).requireValue.github.requireValue,
        ),
        AnimatedLinkWidget(
          sizes: sizes,
          entity: ref.watch(contactLinkProvider).requireValue.linkedin.requireValue,
        ),
        AnimatedLinkWidget(
          sizes: sizes,
          entity: ref.watch(contactLinkProvider).requireValue.mail.requireValue,
        ),
      ],
    ),
  );
  Widget _compactLayout(WidgetRef ref) => Container(
    margin: margin,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        marginLink(
          child: AnimatedLinkWidget(
            sizes: sizes,
            entity: ref.watch(contactLinkProvider).requireValue.github.requireValue,
          ),
        ),
        marginLink(
          child: AnimatedLinkWidget(
            sizes: sizes,
            entity: ref.watch(contactLinkProvider).requireValue.linkedin.requireValue,
          ),
        ),
        marginLink(
          child: AnimatedLinkWidget(
            sizes: sizes,
            entity: ref.watch(contactLinkProvider).requireValue.mail.requireValue,
          ),
        ),
      ],
    ),
  );

  Widget get prefix => Text(
    "links : ",
    style: GoogleFonts.rajdhani(
      fontSize: sizes.fonts.medium,
      color: MyColors.visibleText,
    ),
  );

  EdgeInsetsGeometry get margin => sizes.smallMargins.top
      .add(sizes.leftPartMargin)
      .add(sizes.bigMargins.bot)
  ;

  Widget marginLink({required Widget child}) => Container(
    margin: sizes.smallMargins.top,
    child: child,
  );
}
