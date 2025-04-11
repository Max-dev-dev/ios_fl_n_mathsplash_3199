import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/models/math_quiz_model.dart';
import 'package:ios_f_n_mathsplashcountbignumbers_3199/models/stats_model.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'quizz_cubit.freezed.dart';

class QuizzCubit extends Cubit<QuizzState> {
  final Logger _logger = Logger();
  static const String statsKey = "quiz_stats";

  QuizzCubit() : super(const QuizzState.initial());

  Future<void> loadQuiz() async {
    emit(const QuizzState.loading());
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/examples.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      if (jsonData.containsKey("math_quiz")) {
        final MathQuizModel quiz = MathQuizModel.fromJson(jsonData);
        _logger.i("Quiz data parsed successfully.");
        emit(QuizzState.loaded(quiz));
      } else {
        throw Exception("Invalid JSON format: missing 'math_quiz' key.");
      }
    } catch (e) {
      _logger.e("Error loading quiz data: \$e");
      emit(QuizzState.error(e.toString()));
    }
  }

  Future<void> addQuizResult(String level, int time, int correctAnswers) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Stats> statsList = await getStats();
    statsList.add(
      Stats(level: level, time: time, correctAnswers: correctAnswers),
    );

    List<String> statsJsonList =
        statsList.map((stat) => jsonEncode(stat.toJson())).toList();
    await prefs.setStringList(statsKey, statsJsonList);

    _logger.i(
      "New quiz result saved: Level $level, Time $time, Correct Answers $correctAnswers",
    );
  }

  Future<List<Stats>> getStats() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? statsJsonList = prefs.getStringList(statsKey);

    if (statsJsonList == null) return [];

    return statsJsonList.map((jsonStr) {
      return Stats.fromJson(json.decode(jsonStr));
    }).toList();
  }

  Future<void> clearStats() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(statsKey);
    _logger.i("All quiz statistics cleared.");
  }
}

@freezed
class QuizzState with _$QuizzState {
  const factory QuizzState.initial() = _Initial;
  const factory QuizzState.loading() = _Loading;
  const factory QuizzState.loaded(MathQuizModel quiz) = _Loaded;
  const factory QuizzState.error(String message) = _Error;
}
