import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/cubit/quizz_cubit/quizz_cubit.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/models/stats_model.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String selectedDifficulty = "Easy";

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
                'Leaderboard',
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
            const SizedBox(height: 10),
            _buildDifficultyTabs(),
            const SizedBox(height: 10),
            Expanded(child: _buildLeaderboardList()),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          ["Easy", "Medium", "Hard"].map((difficulty) {
            bool isSelected = selectedDifficulty == difficulty;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDifficulty = difficulty;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xFFFFF0A2)
                          : const Color(0xFF767680),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  difficulty,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildLeaderboardList() {
    return BlocBuilder<QuizzCubit, QuizzState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text("Error: $message")),
          loaded:
              (quiz) => FutureBuilder<List<Stats>>(
                future: context.read<QuizzCubit>().getStats(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<Stats> stats =
                      snapshot.data!
                          .where((s) => s.level == selectedDifficulty)
                          .toList();

                  stats.sort((a, b) {
                    if (b.correctAnswers != a.correctAnswers) {
                      return b.correctAnswers.compareTo(a.correctAnswers);
                    }
                    return a.time.compareTo(b.time);
                  });

                  if (stats.isEmpty) {
                    return const Center(
                      child: Text(
                        "No records available",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: stats.length,
                    itemBuilder: (context, index) {
                      return _buildLeaderboardItem(stats[index]);
                    },
                  );
                },
              ),
        );
      },
    );
  }

  Widget _buildLeaderboardItem(Stats stat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0A2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "📊 Correct Answers: ${stat.correctAnswers}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                '⏳${_formatTime(stat.time)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    return "00:${seconds.toString().padLeft(2, '0')}";
  }
}
