import 'package:bookia/core/routes/navigations_helper.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/assets/app_images.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            bottom: 0,
            child: Column(
              children: [
                const Spacer(flex: 2),
                const CustomSvgPicture(path: AppImages.logoSvg, width: 250),
                const Gap(30),
                const Text('Order Your Book Now!', style: AppStyles.subtitle1),
                const Spacer(flex: 5),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    push(context, Routes.login);
                  },
                ),
                const Gap(15),
                MainButton(
                  borderColor: AppColors.darkColor,
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.darkColor,
                  text: 'Register',
                  onPressed: () {
                    push(context, Routes.register);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
