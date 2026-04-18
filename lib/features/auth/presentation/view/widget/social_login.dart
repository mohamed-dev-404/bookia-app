import 'package:bookia/core/utils/assets/app_icons.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:bookia/features/auth/presentation/view/widget/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOrRow(),
        const Gap(20),
        SocialButton(
          icon: AppIcons.googleSvg,
          label: 'Continue with Google',
          onTap: () {},
        ),
        const Gap(10),
        SocialButton(
          icon: AppIcons.appleSvg,
          label: 'Continue with Facebook',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        const Gap(40),
        Text(
          'Or',
          style: AppStyles.caption1.copyWith(
            color: AppColors.darkGreyColor,
          ),
        ),
        const Gap(40),
        const Expanded(child: Divider()),
      ],
    );
  }
}
