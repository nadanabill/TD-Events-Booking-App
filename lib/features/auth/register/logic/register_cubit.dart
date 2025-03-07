import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/features/auth/register/data/repo/register_repo.dart';

import '../../../../core/networking/api_error_model.dart';
import '../data/models/register_request_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final response = await _registerRepo.register(RegisterRequestModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ));

      response.when(
          success: (patient) => emit(RegisterSuccess()),
          failure: (error) => emit(RegisterFailure(error)));
    }
  }
}
