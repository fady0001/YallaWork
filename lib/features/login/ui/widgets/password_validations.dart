import 'package:flutter/material.dart';
import '../../../../constants/app_localizations.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(AppLocalizations.of(context)!.translate("small_later"), hasLowerCase),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.translate("capital_later"), hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            AppLocalizations.of(context)!.translate("speical_char"), hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.translate("number_char"), hasNumber),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.translate("eight_char"), hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 4,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
