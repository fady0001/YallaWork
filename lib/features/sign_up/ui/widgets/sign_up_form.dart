import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../constants/app_localizations.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validations.dart';
import '../../logic/sign_up_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppLocalizations.of(context)!.translate("firstName"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.translate("validFirstName");
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: AppLocalizations.of(context)!.translate("lastName"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.translate("validLastName");
              }
            },
            controller: context.read<SignupCubit>().lastNameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText:  AppLocalizations.of(context)!.translate("email"),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return AppLocalizations.of(context)!.translate("validemail");
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: AppLocalizations.of(context)!.translate("password"),
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.translate("validpassword");
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: AppLocalizations.of(context)!.translate("confirmPassword"),
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.translate("validpassword");
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}