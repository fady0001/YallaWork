import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/app_localizations.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/customtextfield.dart';
import '../../../sign_up/ui/sign_up_screen.dart';
import '../../logic/cubit/login_cubit.dart';
import 'password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,

        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(AppLocalizations.of(context)!.translate("login"),
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Text(AppLocalizations.of(context)!.translate("login_subtitle"),
                          style: TextStyle(
                              fontSize: 15,
                              color:Colors.grey[700]),),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            HintText: AppLocalizations.of(context)!.translate("email"),
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

                          CustomTextField(
                            controller: context.read<LoginCubit>().passwordController,
                            HintText: AppLocalizations.of(context)!.translate("password"),
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
                        ],
                      ),
                    ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
width: 200,
                        height: 200,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder:(context) => TyprOfJob_Screen()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.translate("login_lastTitle")),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context) => SignupScreen()));
                          },
                          child: Text(AppLocalizations.of(context)!.translate("signup"), style:TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                          ),
                        )
                      ],
                    ),



                  ],
                ),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginStates();
  }
}