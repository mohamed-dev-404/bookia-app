import 'package:flutter/material.dart';

/// NavigationExtension
/// Extension on BuildContext to simplify navigation calls throughout the app.

extension NavigationExtension on BuildContext {
  //* Pushes a new screen onto the navigation stack
  void pushTo(Widget newScreen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
  }

  //* Pushes a new screen and replaces the current one
  void pushReplacement(Widget newScreen) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  //* Pushes a new screen and removes all previous screens from the stack
  void pushBsae(Widget newScreen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
      (route) => false,
    );
  }

  //* Pops the current screen off the navigation stack, returning to the previous screen
  void pop() {
    Navigator.pop(this);
  }
}
