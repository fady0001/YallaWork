import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/sign_up/logic/sign_up_state.dart';



import '../data/models/sign_up_request_body.dart';
import '../data/repos/sign_up_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        first_name: nameController.text,
        last_name: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }
}