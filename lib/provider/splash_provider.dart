import 'package:flutter/material.dart';
import 'package:noteapp/screens/homescreen.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> navigateToHome({context}) async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }),
    );
    notifyListeners();
  }
}
