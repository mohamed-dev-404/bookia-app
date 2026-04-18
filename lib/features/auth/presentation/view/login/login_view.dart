import 'package:bookia/core/helper/app_dialogs.dart';
import 'package:bookia/core/helper/app_snack_bar.dart';
import 'package:bookia/core/routes/navigations_helper.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/assets/app_icons.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:bookia/core/validators/app_validators.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/view/widget/auth_footer.dart';
import 'package:bookia/features/auth/presentation/view/widget/social_login.dart';
import 'package:bookia/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          pop(context);
          pushToBase(context, Routes.main);
        } else if (state is LoginFailure) {
          pop(context);
          AppSnackBar.error(context, state.errorMessage);
        } else if (state is LoginLoading) {
          AppDialogs.showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => pop(context),
                child: const CustomSvgPicture(path: AppIcons.backSvg),
              ),
            ],
          ),
        ),
        body: _loginBody(context),
        bottomNavigationBar: AuthFooter(
          label: 'Don\'t have an account?',
          buttonLabel: 'Sign Up',
          onTap: () {
            pushReplacement(context, Routes.register);
          },
        ),
      ),
    );
  }

  Widget _loginBody(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return MyBodyView(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.loginFormKey,
          child: Column(
            children: [
              const Text(
                'Welcome back! Glad to see you, Again!',
                style: AppStyles.headline,
              ),
              const Gap(32),
              AppTextFormField(
                controller: cubit.emailController,
                hintText: 'Enter your email',
                validator: (value) {
                  return AppValidators.validateEmail(value);
                },
              ),
              const Gap(16),
              PasswordTextFormField(
                controller: cubit.passwordController,
                hintText: 'Enter your password',
                validator: (value) {
                  return AppValidators.validatePassword(value);
                },
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      push(
                        context,
                        Routes.forgotPassword,
                        extra: cubit.emailController.text,
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppStyles.caption1.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              MainButton(
                text: 'Login',
                onPressed: () {
                  if (cubit.loginFormKey.currentState!.validate()) {
                    cubit.login();
                  }
                },
              ),
              const Gap(30),
              const SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
