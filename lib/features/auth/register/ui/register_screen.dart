import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:td_events_booking/features/auth/register/ui/widgets/register_form_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/default_button_widget.dart';
import '../../widgets/social_auth_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      DefaultButtonWidget(
                        text: AppStrings.signUp,
                        onPressed: () {},
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
