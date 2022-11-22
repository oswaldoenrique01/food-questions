// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      answer: Answer.fromJson(json['answer'] as Map<String, dynamic>),
      questionModel: QuestionModel.fromJson(
          json['question_model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'question_model': instance.questionModel,
    };

ResultsModel _$ResultsModelFromJson(Map<String, dynamic> json) => ResultsModel(
      (json['results'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsModelToJson(ResultsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
