import 'package:bookia/core/utils/assets/app_images.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class OpacityAnimatedLogo extends StatelessWidget {
  const OpacityAnimatedLogo({
    super.key,
    required this.opacity,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(
          seconds: 2,
        ),
        child: const CustomSvgPicture(
          path: AppImages.logoSvg,
        ),
      ),
    );
  }
}
