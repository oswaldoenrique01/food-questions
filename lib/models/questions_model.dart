
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionModel {
  String image;
  List<Answer> tags;

  QuestionModel(this.image, this.tags);
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);




}

@JsonSerializable(fieldRename: FieldRename.snake)
class Answer {
  String description;
  bool correct;

  Answer({required this.description, required this.correct});
  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}