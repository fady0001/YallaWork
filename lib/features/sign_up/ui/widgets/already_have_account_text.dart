import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/helpers/extensions.dart';



import '../../../../constants/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text:AppLocalizations.of(context)!.translate("signup_lastTitle"),
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.translate("login"),
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),

        ],
      ),

    );
  }
}
