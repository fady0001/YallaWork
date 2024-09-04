import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:untitled3/features/sign_up/ui/widgets/sign_up_form.dart';

import '../../../constants/app_localizations.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/sign_up_cubit.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    AppLocalizations.of(context)!.translate("signup"),
                style: ( TextStyle(color: buttonYellowColor,fontSize: 50,fontWeight: FontWeight.bold) )
                ),
                verticalSpace(8),
                Text(
                  AppLocalizations.of(context)!.translate("signup_parse"),
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    // AppTextButton(
                    //   buttonText: "Create Account",
                    //   textStyle: TextStyles.font16WhiteSemiBold,
                    //   onPressed: () {
                    //     validateThenDoSignup(context);
                    //   },
                    // ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                      child: Container(

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            validateThenDoSignup(context);
                          },
                          color: buttonYellowColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),

                          ),
                          child: Text(
                            AppLocalizations.of(context)!.translate("sinup_subtitle"), style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,

                          ),
                          ),

                        ),
                      ),
                    ),
                    verticalSpace(16),
                    // const TermsAndConditionsText(),
                    // verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                    // Text('&'),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}