import 'package:flutter/material.dart';
import 'package:tictic/l10n/app_localizations.dart';
import 'package:tictic/screens/welcome/widgets/text_divider.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key, required this.formGlobalKey});
  final GlobalKey<FormState> formGlobalKey;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // wso macht nicht center?
      children: [
        ElevatedButton(
          onPressed: () {
            if(formGlobalKey.currentState!.validate()){
              formGlobalKey.currentState!.save();
              formGlobalKey.currentState!.reset();
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: kMainColor),
          child: Text("Créer mon compte"),
        ),
      ],
    );
  }
}
