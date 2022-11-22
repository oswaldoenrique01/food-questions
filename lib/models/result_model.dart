import 'package:foodquestions/models/questions_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultModel {
  Answer answer;
  QuestionModel questionModel;

  ResultModel({required this.answer, required this.questionModel});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultsModel {
  List<ResultModel> results;

  ResultsModel(this.results);

  factory ResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsModelToJson(this);
}
