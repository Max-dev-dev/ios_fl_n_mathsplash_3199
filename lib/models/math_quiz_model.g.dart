// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'math_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MathQuizModelImpl _$$MathQuizModelImplFromJson(Map<String, dynamic> json) =>
    _$MathQuizModelImpl(
      mathQuiz: DifficultyLevels.fromJson(
        json['math_quiz'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$MathQuizModelImplToJson(_$MathQuizModelImpl instance) =>
    <String, dynamic>{'math_quiz': instance.mathQuiz};

_$DifficultyLevelsImpl _$$DifficultyLevelsImplFromJson(
  Map<String, dynamic> json,
) => _$DifficultyLevelsImpl(
  easy:
      (json['Easy'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
  medium:
      (json['Medium'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
  hard:
      (json['Hard'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DifficultyLevelsImplToJson(
  _$DifficultyLevelsImpl instance,
) => <String, dynamic>{
  'Easy': instance.easy,
  'Medium': instance.medium,
  'Hard': instance.hard,
};

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      example: json['example'] as String,
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      correctAnswer: (json['correct_answer'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'example': instance.example,
      'answers': instance.answers,
      'correct_answer': instance.correctAnswer,
    };
