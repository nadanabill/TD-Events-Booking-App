import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String email = "test@test.com";
  String password = "Password@123";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      if (emailController.text == email &&
          passwordController.text == password) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Login Failed"));
      }
    }
  }
}
