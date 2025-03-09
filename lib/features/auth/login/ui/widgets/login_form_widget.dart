import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/features/auth/login/logic/login_cubit.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spaces.dart';
import '../../../../../core/helpers/validations.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/widgets/default_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(50),
          Text(AppStrings.signIn, style: AppTextStyles.font24Black500),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<LoginCubit>().emailController,
            icon: AppImages.email,
            hintText: 'abc@mail.com',
            textInputType: TextInputType.emailAddress,
            validator: (email) => Validations.validateEmail(email),
          ),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: context.read<LoginCubit>().passwordController,
            icon: AppImages.lock,
            hintText: AppStrings.yourPassword,
            validator: (password) => Validations.validatePassword(password),
            isPassword: true,
            isObscureText: true,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
