import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/features/auth/register/ui/widgets/register_form_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/default_button_widget.dart';
import '../../../../core/widgets/snake_bar.dart';
import '../../widgets/social_auth_widget.dart';
import '../logic/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showSnakeBar(
            context,
            message: AppStrings.youRegisteredSuccessfully,
            error: false,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.otpScreen,
            (route) => false,
          );
        }
        if (state is RegisterFailure) {
          showSnakeBar(
            context,
            message: state.error.toString(),
            error: true,
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const RegisterFormWidget(),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return DefaultButtonWidget(
                              text: AppStrings.signUp,
                              widget: state is RegisterLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: AppColors.white,
                                    ))
                                  : null,
                              onPressed: () {
                                context.read<RegisterCubit>().register();
                              },
                            );
                          },
                        ),
                        const SocialAuthWidget(),
                        verticalSpace(20),
                        Text.rich(
                          TextSpan(
                            text: AppStrings.alreadyHaveAnAccount,
                            style: AppTextStyles.font14Black400,
                            children: [
                              TextSpan(
                                text: AppStrings.signIn,
                                style: AppTextStyles.font14Primary400,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.loginScreen,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
