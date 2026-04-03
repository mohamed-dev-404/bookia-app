import 'package:bookia/app/app.dart';
import 'package:bookia/app/app_initializer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize app services
  await AppInitializer.init();

  runApp(
    DevicePreview(
      enabled: false, //kDebugMode,
      builder: (context) => const Bookia(),
    ),
  );
}
