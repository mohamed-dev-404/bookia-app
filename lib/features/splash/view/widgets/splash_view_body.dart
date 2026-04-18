// ignore_for_file: use_build_context_synchronously
import 'package:bookia/core/routes/navigations_helper.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/splash/view/widgets/animated_slogan.dart';
import 'package:bookia/features/splash/view/widgets/opacity_animated_logo.dart';
import 'package:bookia/features/splash/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 4));
        if (!mounted) return;
        if (state is SplashSuccess) {
          // * token is valid & user data is updated
          pushReplacement(context, Routes.main);
        } else if (state is SplashError) {
          // * user is not logged in or token is expired
          // TODO: handle erros according to the error type (not all errors mean user is not logged in)
          pushReplacement(context, Routes.welcome);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OpacityAnimatedLogo(opacity: opacity),
          const Gap(32),
          AnimatedSlogan(crossFadeState: crossFadeState),
        ],
      ),
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
}
