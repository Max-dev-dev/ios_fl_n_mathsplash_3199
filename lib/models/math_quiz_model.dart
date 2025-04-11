// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'math_quiz_model.freezed.dart';
part 'math_quiz_model.g.dart';

@freezed
class MathQuizModel with _$MathQuizModel {
    const MathQuizModel._();
  const factory MathQuizModel({
    @JsonKey(name: 'math_quiz') required DifficultyLevels mathQuiz,
  }) = _MathQuizModel;

  factory MathQuizModel.fromJson(Map<String, dynamic> json) => _$MathQuizModelFromJson(json);
}

@freezed
class DifficultyLevels with _$DifficultyLevels {
  const DifficultyLevels._();
  const factory DifficultyLevels({
    @JsonKey(name: 'Easy') required List<QuizQuestion> easy,
    @JsonKey(name: 'Medium') required List<QuizQuestion> medium,
    @JsonKey(name: 'Hard') required List<QuizQuestion> hard,
  }) = _DifficultyLevels;

  factory DifficultyLevels.fromJson(Map<String, dynamic> json) => _$DifficultyLevelsFromJson(json);

  void toLogger() {
    final logger = Logger();
    logger.i('MathQuiz Data:');
    logger.i('Easy: \$easy');
    logger.i('Medium: \$medium');
    logger.i('Hard: \$hard');
  }
}

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    @JsonKey(name: 'example') required String example,
    @JsonKey(name: 'answers') required List<int> answers,
    @JsonKey(name: 'correct_answer') required int correctAnswer,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}
