import 'package:flutter/material.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spaces.dart';
import '../../../../../core/helpers/validations.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/widgets/default_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(50),
          Text(AppStrings.signIn, style: AppTextStyles.font24Black400),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: emailController,
            icon: AppImages.email,
            hintText: 'abc@mail.com',
            textInputType: TextInputType.emailAddress,
            validator: (email) {
              Validations.validateEmail(email);
              return null;
            },
          ),
          verticalSpace(20),
          DefaultTextFormFieldWidget(
            controller: passwordController,
            icon: AppImages.lock,
            hintText: AppStrings.yourPassword,
            validator: (password) {
              Validations.validatePassword(password);
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
