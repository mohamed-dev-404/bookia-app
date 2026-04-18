import 'package:bookia/core/helper/app_dialogs.dart';
import 'package:bookia/core/helper/app_snack_bar.dart';
import 'package:bookia/core/routes/navigations_helper.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/assets/app_icons.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:bookia/core/validators/app_validators.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/view/widget/auth_footer.dart';
import 'package:bookia/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          pop(context);
          pushToBase(context, Routes.main);
        } else if (state is RegisterFailure) {
          pop(context);
          AppSnackBar.error(context, state.errorMessage);
        } else if (state is RegisterLoading) {
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
        body: _registerBody(context),
        bottomNavigationBar: AuthFooter(
          label: 'Already have an account?',
          buttonLabel: 'Sign in',
          onTap: () {
            pushReplacement(context, Routes.login);
          },
        ),
      ),
    );
  }

  Widget _registerBody(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return MyBodyView(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.registerFormKey,
          child: Column(
            children: [
              const Text(
                'Hello! Register to get started',
                style: AppStyles.headline,
              ),
              const Gap(32),
              AppTextFormField(
                controller: cubit.nameController,
                hintText: 'Full Name',
                validator: (value) {
                  return AppValidators.validateName(value);
                },
              ),
              const Gap(16),
              AppTextFormField(
                controller: cubit.emailController,
                hintText: 'Email',
                validator: (value) {
                  return AppValidators.validateEmail(value);
                },
              ),
              const Gap(16),
              PasswordTextFormField(
                controller: cubit.passwordController,
                hintText: 'Password',
                validator: (value) {
                  return AppValidators.validatePassword(value);
                },
              ),
              const Gap(16),
              PasswordTextFormField(
                controller: cubit.confirmPasswordController,
                hintText: 'Confirm Password',
                validator: (value) {
                  return AppValidators.validateConfirmPassword(
                    value,
                    cubit.passwordController.text,
                  );
                },
              ),
              const Gap(30),
              MainButton(
                text: 'Register',
                onPressed: () {
                  if (cubit.registerFormKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
