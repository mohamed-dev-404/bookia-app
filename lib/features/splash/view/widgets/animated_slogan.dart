import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AnimatedSlogan extends StatelessWidget {
  const AnimatedSlogan({
    super.key,
    required this.crossFadeState,
  });

  final CrossFadeState crossFadeState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Find Your Book, ',
          style: AppStyles.subtitle2,
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: 50),
          secondChild: const Text(
            'Order It Now !',
            style: AppStyles.subtitle2,
          ),
          crossFadeState: crossFadeState,
          duration: const Duration(seconds: 2),
        ),
      ],
    );
  }
}
