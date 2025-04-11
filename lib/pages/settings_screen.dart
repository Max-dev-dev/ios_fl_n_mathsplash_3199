import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/app.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/cubit/quizz_cubit/quizz_cubit.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isMusicOn = true;

  void _showResetProgressDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF60442C), width: 4),
          ),
          backgroundColor: const Color(0xFFFFF0A2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Reset Progress",
                    style: TextStyle(
                      color: Color(0xFF60442C),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Are you sure you want to delete all progress? This action cannot be undone.",
                  style: TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      backgroundColor: Colors.red[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.red[900]!, width: 2),
                      ),
                    ),
                    onPressed: () {
                      context.read<QuizzCubit>().clearStats();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[900],
                          content: const Text(
                            "Progress has been reset",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text(
                      "Reset Progress",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      backgroundColor: const Color(0xFF60442C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Color(0xFF60442C),
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xFFFFF0A2),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            ..._buildButtons(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    return [
      _buildMusicToggle(),
      _buildElevatedButton(
        'Reset progress',
        Icons.refresh,
        _showResetProgressDialog,
      ),
      _buildElevatedButton('Share the app', Icons.share, _shareApp),
      _buildElevatedButton('Terms of use', Icons.description, _openTermsOfUse),
    ];
  }

  Widget _buildMusicToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Music',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF60442C),
                ),
              ),
              Switch(
                value: isMusicOn,
                onChanged: (value) {
                  setState(() {
                    isMusicOn = value;
                    AudioManager().toggleMusic(value);
                  });
                },
                activeColor: Colors.brown,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF60442C),
                ),
              ),
              const SizedBox(width: 12),
              Icon(icon, color: const Color(0xFF60442C), size: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  void _openTermsOfUse() async {
    const url =
        'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _shareApp() {
    const appName = 'Math Splash: Count Big Numbers';
    const description =
        '''Math Splash: Count Big Numbers is a fun and interactive game where fishing meets math. Players dive into an exciting underwater world guided by the friendly Captain Splash, who sets unique challenges at each level. The goal is to catch the right fish based on mathematical rules, such as multiples, prime numbers, and number ranges, while avoiding tricky distractions. As players progress, the challenges become more complex, making the game both engaging and educational.

Beyond fishing, the game also features a Quiz Mode, where players can put their math skills to the test by answering carefully crafted math questions. With different difficulty levels and a chance to track progress, the quiz offers an alternative way to practice math in a pressure-free environment.''';
    Share.share('$appName\n\n$description');
  }
}
