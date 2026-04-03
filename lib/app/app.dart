import 'dart:io';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:bookia/core/utils/themes/app_themes.dart';
import 'package:flutter/material.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: SafeArea(
            top: false,
            bottom: Platform.isAndroid,
            child: child!,
          ),
        );
      },
      home: const Scaffold(
        //TODO: this widget for testing purposes, replace with SplashScreen() when finish initialization
        body: Center(
          child: Text(
            'Welcome to Bookia!',
            style: AppStyles.headline,
          ),
        ),
      ), //SplashScreen(),
    );
  }
}
