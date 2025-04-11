import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/cubit/quizz_cubit/quizz_cubit.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/home_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/onboarding_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  final AudioPlayer _player = AudioPlayer();
  bool _isMusicOn = true;

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isMusicOn = prefs.getBool('isMusicOn') ?? true;
    if (_isMusicOn) {
      await _player.setAsset('assets/bg_music.wav');
      _player.setLoopMode(LoopMode.one);
      _player.play();
    }
  }

  void toggleMusic(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isMusicOn = value;
    await prefs.setBool('isMusicOn', _isMusicOn);
    if (_isMusicOn) {
      await _player.play();
    } else {
      await _player.pause();
    }
  }

  bool get isMusicOn => _isMusicOn;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizzCubit()..loadQuiz(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.transparent,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: const Color(0xFFFFF0A2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFF60442C), width: 3),
              ),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AudioManager().init();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('first_run') ?? true;

    if (isFirstRun) {
      await prefs.setBool('first_run', false);
    }

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => isFirstRun ? OnboardingScreen() : const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/splash_background.png',
            fit: BoxFit.cover,
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
