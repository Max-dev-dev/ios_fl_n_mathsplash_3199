import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/cubit/quizz_cubit/quizz_cubit.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/models/math_quiz_model.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/home_screen.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/pages/quizz/start_quiz_screen.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;
  const QuizScreen({super.key, required this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int totalQuestions = 10;
  late Timer _timer;
  int secondsElapsed = 0;
  bool isPaused = false;
  bool answered = false;
  int? selectedAnswer;

  @override
  void initState() {
    super.initState();
    context.read<QuizzCubit>().loadQuiz();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused) {
        setState(() {
          secondsElapsed++;
        });
      }
    });
  }

  void _pauseQuiz(double screenWidth) {
    setState(() {
      isPaused = true;
    });
    _showPauseDialog(screenWidth);
  }

  void _resumeQuiz() {
    setState(() {
      isPaused = false;
    });
  }

  void _showPauseDialog(double screenWidth) {
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
              children: [
                const Text(
                  "Quiz Paused!",
                  style: TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "You have paused the quiz. Do you want to continue where you left off or exit?",
                  style: TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: screenWidth > 375 ? 150 : 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          backgroundColor: const Color(0xFFFFF0A2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Color(0xFF60442C),
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            ),
                        child: const Text(
                          "Main Menu",
                          style: TextStyle(
                            color: Color(0xFF60442C),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth > 375 ? 150 : 100,
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
                        onPressed: () {
                          Navigator.pop(context);
                          _resumeQuiz();
                        },
                        child: const Text(
                          "Resume",
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
              ],
            ),
          ),
        );
      },
    );
  }

  void _answerQuestion(int answer, int correctAnswer, double screenWidth) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedAnswer = answer;
      if (answer == correctAnswer) {
        correctAnswers++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex + 1 < totalQuestions) {
        setState(() {
          currentQuestionIndex++;
          answered = false;
          selectedAnswer = null;
        });
      } else {
        _showResultDialog(screenWidth);
      }
    });
  }

  void _showResultDialog(double screenWidth) {
    _timer.cancel();

    final quizzCubit = context.read<QuizzCubit>();
    quizzCubit.addQuizResult(widget.difficulty, secondsElapsed, correctAnswers);

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
                    "Quiz Completed!",
                    style: TextStyle(
                      color: Color(0xFF60442C),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Great job! Here’s how you did:",
                  style: TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  "✅ Correct Answers: $correctAnswers/$totalQuestions",
                  style: const TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  "⏳ Total Quiz Duration: $secondsElapsed sec",
                  style: const TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                const Text(
                  "🔥 Keep practicing to improve your score!",
                  style: TextStyle(
                    color: Color(0xFF60442C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
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
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                    child: const Text(
                      "Main Menu",
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
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<QuizzCubit, QuizzState>(
        builder:
            (context, state) => state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text("Error: $message")),
              loaded: (quiz) {
                final questions =
                    widget.difficulty.toLowerCase() == 'easy'
                        ? quiz.mathQuiz.easy
                        : widget.difficulty.toLowerCase() == 'medium'
                        ? quiz.mathQuiz.medium
                        : quiz.mathQuiz.hard;

                if (questions.isEmpty ||
                    currentQuestionIndex >= questions.length) {
                  return const Center(child: Text("No questions available"));
                }

                final question = questions[currentQuestionIndex];

                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/main_background.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${currentQuestionIndex + 1}/$totalQuestions",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${secondsElapsed}s",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _pauseQuiz(screenWidth),
                                  icon: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.pause,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 40,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/container.png',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          question.example,
                                          style: const TextStyle(
                                            fontSize: 26,
                                            color: Color(0xFF60442C),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 100),
                                        ...question.answers.map(
                                          (answer) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 16.0,
                                                      ),
                                                  backgroundColor:
                                                      selectedAnswer == answer
                                                          ? (answer ==
                                                                  question
                                                                      .correctAnswer
                                                              ? const Color(
                                                                0xFF82DC03,
                                                              )
                                                              : const Color(
                                                                0xFFDC4A03,
                                                              ))
                                                          : const Color(
                                                            0xFFFFF0A2,
                                                          ),
                                                ),
                                                onPressed:
                                                    () => _answerQuestion(
                                                      answer,
                                                      question.correctAnswer,
                                                      screenWidth
                                                    ),
                                                child: Text(
                                                  "$answer",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        selectedAnswer == answer
                                                            ? Colors.white
                                                            : const Color(
                                                              0xFF60442C,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
