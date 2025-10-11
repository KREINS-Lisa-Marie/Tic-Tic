import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictic/l10n/app_localizations.dart';

import '../../../constants/sizes.dart';

class LogoWelcome extends StatelessWidget {
  const LogoWelcome ({super.key});

  @override
  Widget build(BuildContext context) {
    return      SvgPicture.asset(
      "assets/icons/logo.svg",
      height: MediaQuery.of(context).size.height*kLogoSizeRatioWelcome,
      width: MediaQuery.of(context).size.height*kLogoSizeRatioWelcome,
      semanticsLabel: AppLocalizations.of(context)?.semanticLabel,
    );
  }
}
