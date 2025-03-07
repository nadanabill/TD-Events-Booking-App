import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helpers/spaces.dart';
import '../../../../../core/helpers/validations.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/widgets/default_text_form_field_widget.dart';
import '../../logic/register_cubit.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(AppStrings.signUp, style: AppTextStyles.font24Black400),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<RegisterCubit>().nameController,
            icon: AppImages.profile,
            hintText: AppStrings.fullName,
            validator: (name) => Validations.validateName(name),
          ),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<RegisterCubit>().emailController,
            icon: AppImages.email,
            hintText: 'abc@mail.com',
            textInputType: TextInputType.emailAddress,
            validator: (email) => Validations.validateEmail(email),
          ),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<RegisterCubit>().passwordController,
            icon: AppImages.lock,
            hintText: AppStrings.yourPassword,
            validator: (password) => Validations.validatePassword(password),
            isPassword: true,
            isObscureText: true,
          ),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<RegisterCubit>().confirmPasswordController,
            icon: AppImages.lock,
            hintText: AppStrings.confirmPassword,
            validator: (confirmPassword) {
              if (confirmPassword!.isEmpty) {
                return '🔴 Confirm password is required!';
              }
              if (context
                      .read<RegisterCubit>()
                      .confirmPasswordController
                      .text !=
                  context.read<RegisterCubit>().passwordController.text) {
                return AppStrings.passwordsDoNotMatch;
              }
              return null;
            },
            isPassword: true,
            isObscureText: true,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
