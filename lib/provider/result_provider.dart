import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodquestions/models/result_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_provider.freezed.dart';

final resultProvider = StateNotifierProvider<ResultProvider, ResultState>(
    (ref) => ResultProvider(ResultState()));

class ResultProvider extends StateNotifier<ResultState> {
  ResultProvider(super.state);

  addResult(ResultModel result) {
    final newList = [...state.results];
    newList.removeWhere(
        (element) => element.questionModel == result.questionModel);
    newList.add(result);
    state = state.copyWith(results: newList);
  }

  cleanList() {
    state = state.copyWith(results: []);
  }

  List<String> validations() {
    final options = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    final results = <String>[];
    state.results.forEach((result) {
      final correctAnswer =
          result.questionModel.tags.indexWhere((element) => element.correct);
      final selectedAnswer = result.questionModel.tags
          .indexWhere((element) => element == result.answer);
      results.add(correctAnswer == selectedAnswer
          ? "${options[selectedAnswer]}. ¡MUY BIEN! 😁 Respuesta correcta: "
          : "Respuesta incorrecta 😭. La respuesta correcta es: ${options[correctAnswer]} ");
    });

    return results;
  }
}

@freezed
class ResultState with _$ResultState {
  factory ResultState({
    @Default([]) List<ResultModel> results,
  }) = _ResultState;
}
