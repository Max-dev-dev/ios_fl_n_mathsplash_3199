import 'package:flutter/material.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/about_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/leaderboard_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/quizz/start_quiz_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/settings_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/tips_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Math Splash: \n Count Big Numbers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ..._buildButtons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    final List<Map<String, dynamic>> buttons = [
      {
        'label': 'Play',
        'onPressed':
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StartQuizScreen()),
            ),
      },
      {'label': 'Leaderboard', 'onPressed': () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
            ),},
      {
        'label': 'Tips',
        'onPressed':
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TipsScreen()),
            ),
      },
      {
        'label': 'About',
        'onPressed':
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            ),
      },
      {
        'label': 'Settings',
        'onPressed':
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
      },
    ];

    return buttons.map((button) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: button['onPressed'],
            child: Text(
              button['label'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF60442C),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
