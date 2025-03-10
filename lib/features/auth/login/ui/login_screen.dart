import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/widgets/default_button_widget.dart';
import 'package:td_events_booking/core/widgets/snake_bar.dart';
import 'package:td_events_booking/features/auth/login/ui/widgets/login_form_widget.dart';
import 'package:td_events_booking/features/auth/login/ui/widgets/remember_forget_widget.dart';
import 'package:td_events_booking/features/auth/widgets/social_auth_widget.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showSnakeBar(
            context,
            message: AppStrings.loginSuccessfully,
            error: false,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.layout,
            (route) => false,
          );
        }
        if (state is LoginFailure) {
          showSnakeBar(
            context,
            message: state.message,
            error: true,
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.topRight,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      AppImages.logo,
                    ),
                    const LoginFormWidget(),
                    const RememberForgetWidget(),
                    verticalSpace(30),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return DefaultButtonWidget(
                          text: AppStrings.signIn,
                          widget: state is LoginLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                  ),
                                )
                              : null,
                          onPressed: () {
                            context.read<LoginCubit>().login();
                          },
                        );
                      },
                    ),
                    const SocialAuthWidget(),
                    verticalSpace(15),
                    Text.rich(
                      TextSpan(
                        text: AppStrings.doNotHaveAnAccount,
                        style: AppTextStyles.font14Black400,
                        children: [
                          TextSpan(
                            text: AppStrings.signUp,
                            style: AppTextStyles.font14Primary400,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, Routes.registerScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
