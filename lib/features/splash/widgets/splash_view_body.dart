import 'package:bookia/core/routes/navigations_helper.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/splash/widgets/animated_slogan.dart';
import 'package:bookia/features/splash/widgets/opacity_animated_logo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double opacity = 0;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToWelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OpacityAnimatedLogo(opacity: opacity),
        const Gap(32),
        AnimatedSlogan(crossFadeState: crossFadeState),
      ],
    );
  }

  void _startAnimation() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          opacity = 1;
          crossFadeState = CrossFadeState.showSecond;
        });
      },
    );
  }

  void _navigateToWelcome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (!mounted) return;
        pushReplacement(context, Routes.welcome);
      },
    );
  }
}
