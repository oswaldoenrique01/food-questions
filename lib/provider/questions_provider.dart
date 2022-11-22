import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodquestions/data/questions_data.dart';
import 'package:foodquestions/models/questions_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_provider.freezed.dart';

final questionsProvider =
    StateNotifierProvider<QuestionsProvider, QuestionsState>(
        (ref) => QuestionsProvider(QuestionsState()));

class QuestionsProvider extends StateNotifier<QuestionsState> {
  QuestionsProvider(super.state);

  randomData() {
    questionsData.shuffle();
    state = state.copyWith(questions: questionsData);
  }

  selectState(int? select) {
    state = state.copyWith(select: select);
  }
}

@freezed
class QuestionsState with _$QuestionsState {
  factory QuestionsState({
    @Default([]) List<QuestionModel> questions,
    int? select,
    @Default({}) Map<int, Map<String, String>> save,
  }) = _QuestionsState;
}
