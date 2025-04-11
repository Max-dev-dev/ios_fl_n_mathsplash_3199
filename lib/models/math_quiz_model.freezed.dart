// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'math_quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MathQuizModel _$MathQuizModelFromJson(Map<String, dynamic> json) {
  return _MathQuizModel.fromJson(json);
}

/// @nodoc
mixin _$MathQuizModel {
  @JsonKey(name: 'math_quiz')
  DifficultyLevels get mathQuiz => throw _privateConstructorUsedError;

  /// Serializes this MathQuizModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MathQuizModelCopyWith<MathQuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MathQuizModelCopyWith<$Res> {
  factory $MathQuizModelCopyWith(
    MathQuizModel value,
    $Res Function(MathQuizModel) then,
  ) = _$MathQuizModelCopyWithImpl<$Res, MathQuizModel>;
  @useResult
  $Res call({@JsonKey(name: 'math_quiz') DifficultyLevels mathQuiz});

  $DifficultyLevelsCopyWith<$Res> get mathQuiz;
}

/// @nodoc
class _$MathQuizModelCopyWithImpl<$Res, $Val extends MathQuizModel>
    implements $MathQuizModelCopyWith<$Res> {
  _$MathQuizModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mathQuiz = null}) {
    return _then(
      _value.copyWith(
            mathQuiz:
                null == mathQuiz
                    ? _value.mathQuiz
                    : mathQuiz // ignore: cast_nullable_to_non_nullable
                        as DifficultyLevels,
          )
          as $Val,
    );
  }

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DifficultyLevelsCopyWith<$Res> get mathQuiz {
    return $DifficultyLevelsCopyWith<$Res>(_value.mathQuiz, (value) {
      return _then(_value.copyWith(mathQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MathQuizModelImplCopyWith<$Res>
    implements $MathQuizModelCopyWith<$Res> {
  factory _$$MathQuizModelImplCopyWith(
    _$MathQuizModelImpl value,
    $Res Function(_$MathQuizModelImpl) then,
  ) = __$$MathQuizModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'math_quiz') DifficultyLevels mathQuiz});

  @override
  $DifficultyLevelsCopyWith<$Res> get mathQuiz;
}

/// @nodoc
class __$$MathQuizModelImplCopyWithImpl<$Res>
    extends _$MathQuizModelCopyWithImpl<$Res, _$MathQuizModelImpl>
    implements _$$MathQuizModelImplCopyWith<$Res> {
  __$$MathQuizModelImplCopyWithImpl(
    _$MathQuizModelImpl _value,
    $Res Function(_$MathQuizModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mathQuiz = null}) {
    return _then(
      _$MathQuizModelImpl(
        mathQuiz:
            null == mathQuiz
                ? _value.mathQuiz
                : mathQuiz // ignore: cast_nullable_to_non_nullable
                    as DifficultyLevels,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MathQuizModelImpl extends _MathQuizModel {
  const _$MathQuizModelImpl({
    @JsonKey(name: 'math_quiz') required this.mathQuiz,
  }) : super._();

  factory _$MathQuizModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MathQuizModelImplFromJson(json);

  @override
  @JsonKey(name: 'math_quiz')
  final DifficultyLevels mathQuiz;

  @override
  String toString() {
    return 'MathQuizModel(mathQuiz: $mathQuiz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MathQuizModelImpl &&
            (identical(other.mathQuiz, mathQuiz) ||
                other.mathQuiz == mathQuiz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mathQuiz);

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MathQuizModelImplCopyWith<_$MathQuizModelImpl> get copyWith =>
      __$$MathQuizModelImplCopyWithImpl<_$MathQuizModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MathQuizModelImplToJson(this);
  }
}

abstract class _MathQuizModel extends MathQuizModel {
  const factory _MathQuizModel({
    @JsonKey(name: 'math_quiz') required final DifficultyLevels mathQuiz,
  }) = _$MathQuizModelImpl;
  const _MathQuizModel._() : super._();

  factory _MathQuizModel.fromJson(Map<String, dynamic> json) =
      _$MathQuizModelImpl.fromJson;

  @override
  @JsonKey(name: 'math_quiz')
  DifficultyLevels get mathQuiz;

  /// Create a copy of MathQuizModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MathQuizModelImplCopyWith<_$MathQuizModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DifficultyLevels _$DifficultyLevelsFromJson(Map<String, dynamic> json) {
  return _DifficultyLevels.fromJson(json);
}

/// @nodoc
mixin _$DifficultyLevels {
  @JsonKey(name: 'Easy')
  List<QuizQuestion> get easy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Medium')
  List<QuizQuestion> get medium => throw _privateConstructorUsedError;
  @JsonKey(name: 'Hard')
  List<QuizQuestion> get hard => throw _privateConstructorUsedError;

  /// Serializes this DifficultyLevels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DifficultyLevels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DifficultyLevelsCopyWith<DifficultyLevels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyLevelsCopyWith<$Res> {
  factory $DifficultyLevelsCopyWith(
    DifficultyLevels value,
    $Res Function(DifficultyLevels) then,
  ) = _$DifficultyLevelsCopyWithImpl<$Res, DifficultyLevels>;
  @useResult
  $Res call({
    @JsonKey(name: 'Easy') List<QuizQuestion> easy,
    @JsonKey(name: 'Medium') List<QuizQuestion> medium,
    @JsonKey(name: 'Hard') List<QuizQuestion> hard,
  });
}

/// @nodoc
class _$DifficultyLevelsCopyWithImpl<$Res, $Val extends DifficultyLevels>
    implements $DifficultyLevelsCopyWith<$Res> {
  _$DifficultyLevelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DifficultyLevels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? easy = null, Object? medium = null, Object? hard = null}) {
    return _then(
      _value.copyWith(
            easy:
                null == easy
                    ? _value.easy
                    : easy // ignore: cast_nullable_to_non_nullable
                        as List<QuizQuestion>,
            medium:
                null == medium
                    ? _value.medium
                    : medium // ignore: cast_nullable_to_non_nullable
                        as List<QuizQuestion>,
            hard:
                null == hard
                    ? _value.hard
                    : hard // ignore: cast_nullable_to_non_nullable
                        as List<QuizQuestion>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DifficultyLevelsImplCopyWith<$Res>
    implements $DifficultyLevelsCopyWith<$Res> {
  factory _$$DifficultyLevelsImplCopyWith(
    _$DifficultyLevelsImpl value,
    $Res Function(_$DifficultyLevelsImpl) then,
  ) = __$$DifficultyLevelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'Easy') List<QuizQuestion> easy,
    @JsonKey(name: 'Medium') List<QuizQuestion> medium,
    @JsonKey(name: 'Hard') List<QuizQuestion> hard,
  });
}

/// @nodoc
class __$$DifficultyLevelsImplCopyWithImpl<$Res>
    extends _$DifficultyLevelsCopyWithImpl<$Res, _$DifficultyLevelsImpl>
    implements _$$DifficultyLevelsImplCopyWith<$Res> {
  __$$DifficultyLevelsImplCopyWithImpl(
    _$DifficultyLevelsImpl _value,
    $Res Function(_$DifficultyLevelsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DifficultyLevels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? easy = null, Object? medium = null, Object? hard = null}) {
    return _then(
      _$DifficultyLevelsImpl(
        easy:
            null == easy
                ? _value._easy
                : easy // ignore: cast_nullable_to_non_nullable
                    as List<QuizQuestion>,
        medium:
            null == medium
                ? _value._medium
                : medium // ignore: cast_nullable_to_non_nullable
                    as List<QuizQuestion>,
        hard:
            null == hard
                ? _value._hard
                : hard // ignore: cast_nullable_to_non_nullable
                    as List<QuizQuestion>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DifficultyLevelsImpl extends _DifficultyLevels {
  const _$DifficultyLevelsImpl({
    @JsonKey(name: 'Easy') required final List<QuizQuestion> easy,
    @JsonKey(name: 'Medium') required final List<QuizQuestion> medium,
    @JsonKey(name: 'Hard') required final List<QuizQuestion> hard,
  }) : _easy = easy,
       _medium = medium,
       _hard = hard,
       super._();

  factory _$DifficultyLevelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DifficultyLevelsImplFromJson(json);

  final List<QuizQuestion> _easy;
  @override
  @JsonKey(name: 'Easy')
  List<QuizQuestion> get easy {
    if (_easy is EqualUnmodifiableListView) return _easy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_easy);
  }

  final List<QuizQuestion> _medium;
  @override
  @JsonKey(name: 'Medium')
  List<QuizQuestion> get medium {
    if (_medium is EqualUnmodifiableListView) return _medium;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medium);
  }

  final List<QuizQuestion> _hard;
  @override
  @JsonKey(name: 'Hard')
  List<QuizQuestion> get hard {
    if (_hard is EqualUnmodifiableListView) return _hard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hard);
  }

  @override
  String toString() {
    return 'DifficultyLevels(easy: $easy, medium: $medium, hard: $hard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DifficultyLevelsImpl &&
            const DeepCollectionEquality().equals(other._easy, _easy) &&
            const DeepCollectionEquality().equals(other._medium, _medium) &&
            const DeepCollectionEquality().equals(other._hard, _hard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_easy),
    const DeepCollectionEquality().hash(_medium),
    const DeepCollectionEquality().hash(_hard),
  );

  /// Create a copy of DifficultyLevels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DifficultyLevelsImplCopyWith<_$DifficultyLevelsImpl> get copyWith =>
      __$$DifficultyLevelsImplCopyWithImpl<_$DifficultyLevelsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DifficultyLevelsImplToJson(this);
  }
}

abstract class _DifficultyLevels extends DifficultyLevels {
  const factory _DifficultyLevels({
    @JsonKey(name: 'Easy') required final List<QuizQuestion> easy,
    @JsonKey(name: 'Medium') required final List<QuizQuestion> medium,
    @JsonKey(name: 'Hard') required final List<QuizQuestion> hard,
  }) = _$DifficultyLevelsImpl;
  const _DifficultyLevels._() : super._();

  factory _DifficultyLevels.fromJson(Map<String, dynamic> json) =
      _$DifficultyLevelsImpl.fromJson;

  @override
  @JsonKey(name: 'Easy')
  List<QuizQuestion> get easy;
  @override
  @JsonKey(name: 'Medium')
  List<QuizQuestion> get medium;
  @override
  @JsonKey(name: 'Hard')
  List<QuizQuestion> get hard;

  /// Create a copy of DifficultyLevels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DifficultyLevelsImplCopyWith<_$DifficultyLevelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  @JsonKey(name: 'example')
  String get example => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  List<int> get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
    QuizQuestion value,
    $Res Function(QuizQuestion) then,
  ) = _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call({
    @JsonKey(name: 'example') String example,
    @JsonKey(name: 'answers') List<int> answers,
    @JsonKey(name: 'correct_answer') int correctAnswer,
  });
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
    Object? answers = null,
    Object? correctAnswer = null,
  }) {
    return _then(
      _value.copyWith(
            example:
                null == example
                    ? _value.example
                    : example // ignore: cast_nullable_to_non_nullable
                        as String,
            answers:
                null == answers
                    ? _value.answers
                    : answers // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            correctAnswer:
                null == correctAnswer
                    ? _value.correctAnswer
                    : correctAnswer // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
    _$QuizQuestionImpl value,
    $Res Function(_$QuizQuestionImpl) then,
  ) = __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'example') String example,
    @JsonKey(name: 'answers') List<int> answers,
    @JsonKey(name: 'correct_answer') int correctAnswer,
  });
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
    _$QuizQuestionImpl _value,
    $Res Function(_$QuizQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
    Object? answers = null,
    Object? correctAnswer = null,
  }) {
    return _then(
      _$QuizQuestionImpl(
        example:
            null == example
                ? _value.example
                : example // ignore: cast_nullable_to_non_nullable
                    as String,
        answers:
            null == answers
                ? _value._answers
                : answers // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        correctAnswer:
            null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl({
    @JsonKey(name: 'example') required this.example,
    @JsonKey(name: 'answers') required final List<int> answers,
    @JsonKey(name: 'correct_answer') required this.correctAnswer,
  }) : _answers = answers;

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'example')
  final String example;
  final List<int> _answers;
  @override
  @JsonKey(name: 'answers')
  List<int> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'correct_answer')
  final int correctAnswer;

  @override
  String toString() {
    return 'QuizQuestion(example: $example, answers: $answers, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.example, example) || other.example == example) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    example,
    const DeepCollectionEquality().hash(_answers),
    correctAnswer,
  );

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(this);
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion({
    @JsonKey(name: 'example') required final String example,
    @JsonKey(name: 'answers') required final List<int> answers,
    @JsonKey(name: 'correct_answer') required final int correctAnswer,
  }) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'example')
  String get example;
  @override
  @JsonKey(name: 'answers')
  List<int> get answers;
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
