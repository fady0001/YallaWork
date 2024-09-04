
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/app_localizations.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';
import 'dont_have_account_text.dart';
import 'login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
    // //  backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //
    //    // backgroundColor: Colors.white,
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: Icon(Icons.arrow_back_ios,
    //         size: 20,
    //         color: Colors.black,),
    //
    //
    //     ),
    //   ),
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.translate("login"),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color:  buttonYellowColor,)),
                        SizedBox(height: 10,),
                        Text(AppLocalizations.of(context)!.translate("login_subtitle"),
                          style: TextStyles.font14GrayRegular,),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: context.read<LoginCubit>().formKey,
                        child: Column(
                          children: <Widget>[
                            AppTextFormField(
                              hintText: AppLocalizations.of(context)!.translate("email"),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !AppRegex.isEmailValid(value)) {
                                  return AppLocalizations.of(context)!.translate("validemail");
                                }
                              },
                              controller: context.read<LoginCubit>().emailController,
                            ),
                            SizedBox(height: 10,),
                            AppTextFormField(
                              controller: context.read<LoginCubit>().passwordController,
                              hintText:AppLocalizations.of(context)!.translate("password"),
                              isObscureText: isObscureText,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText ? Icons.visibility_off : Icons.visibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!.translate("validpassword");
                                }
                              },
                            ),
                            verticalSpace(10),
                            // Container(
                            //   child: PasswordValidations(
                            //     hasLowerCase: hasLowercase,
                            //     hasUpperCase: hasUppercase,
                            //     hasSpecialCharacters: hasSpecialCharacters,
                            //     hasNumber: hasNumber,
                            //     hasMinLength: hasMinLength,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
        
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            validateThenDoLogin(context);
                          },
                          color: buttonYellowColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
        
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.translate("login"), style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                    Container(
                      padding: EdgeInsets.only(top: 60),
                      height: 260,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                             image: AssetImage("assets/images/Login.gif"),
                            fit: BoxFit.fitHeight
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}