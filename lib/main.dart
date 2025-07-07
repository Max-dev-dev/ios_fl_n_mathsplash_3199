import 'package:flutter/material.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/app.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/ver_screen.dart';

class AppConstants {
  static const String oneSignalAppId = "ba40d8ae-fbe2-4572-b04b-12124a0ac394";
  static const String appsFlyerDevKey = "EsJBZj76R5fCiere38Z6Dd";
  static const String appID = "6748059722";

  static const String baseDomain = "splendiferous-grandiose-championship.space";
  static const String verificationParam = "CBG4EwkJ";

  static const String splashImagePath = 'assets/images/splash_background.png';
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final now = DateTime.now();
  final dateOff = DateTime(2025, 7, 11, 20, 00);

  final initialRoute = now.isBefore(dateOff) ? '/white' : '/verify';
  runApp(RootApp(
    initialRoute: initialRoute,
    whiteScreen: MainApp(),
  ));
}
