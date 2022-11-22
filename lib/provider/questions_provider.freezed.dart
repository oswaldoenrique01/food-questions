// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'questions_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionsState {
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  int? get select => throw _privateConstructorUsedError;
  Map<int, Map<String, String>> get save => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionsStateCopyWith<QuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsStateCopyWith<$Res> {
  factory $QuestionsStateCopyWith(
          QuestionsState value, $Res Function(QuestionsState) then) =
      _$QuestionsStateCopyWithImpl<$Res, QuestionsState>;
  @useResult
  $Res call(
      {List<QuestionModel> questions,
      int? select,
      Map<int, Map<String, String>> save});
}

/// @nodoc
class _$QuestionsStateCopyWithImpl<$Res, $Val extends QuestionsState>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? select = freezed,
    Object? save = null,
  }) {
    return _then(_value.copyWith(
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as int?,
      save: null == save
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as Map<int, Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionsStateCopyWith<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  factory _$$_QuestionsStateCopyWith(
          _$_QuestionsState value, $Res Function(_$_QuestionsState) then) =
      __$$_QuestionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuestionModel> questions,
      int? select,
      Map<int, Map<String, String>> save});
}

/// @nodoc
class __$$_QuestionsStateCopyWithImpl<$Res>
    extends _$QuestionsStateCopyWithImpl<$Res, _$_QuestionsState>
    implements _$$_QuestionsStateCopyWith<$Res> {
  __$$_QuestionsStateCopyWithImpl(
      _$_QuestionsState _value, $Res Function(_$_QuestionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? select = freezed,
    Object? save = null,
  }) {
    return _then(_$_QuestionsState(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as int?,
      save: null == save
          ? _value._save
          : save // ignore: cast_nullable_to_non_nullable
              as Map<int, Map<String, String>>,
    ));
  }
}

/// @nodoc

class _$_QuestionsState implements _QuestionsState {
  _$_QuestionsState(
      {final List<QuestionModel> questions = const [],
      this.select,
      final Map<int, Map<String, String>> save = const {}})
      : _questions = questions,
        _save = save;

  final List<QuestionModel> _questions;
  @override
  @JsonKey()
  List<QuestionModel> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int? select;
  final Map<int, Map<String, String>> _save;
  @override
  @JsonKey()
  Map<int, Map<String, String>> get save {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_save);
  }

  @override
  String toString() {
    return 'QuestionsState(questions: $questions, select: $select, save: $save)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionsState &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.select, select) || other.select == select) &&
            const DeepCollectionEquality().equals(other._save, _save));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      select,
      const DeepCollectionEquality().hash(_save));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionsStateCopyWith<_$_QuestionsState> get copyWith =>
      __$$_QuestionsStateCopyWithImpl<_$_QuestionsState>(this, _$identity);
}

abstract class _QuestionsState implements QuestionsState {
  factory _QuestionsState(
      {final List<QuestionModel> questions,
      final int? select,
      final Map<int, Map<String, String>> save}) = _$_QuestionsState;

  @override
  List<QuestionModel> get questions;
  @override
  int? get select;
  @override
  Map<int, Map<String, String>> get save;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsStateCopyWith<_$_QuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
