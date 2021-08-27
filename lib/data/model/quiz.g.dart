// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return QuizResponse(
    quizes: (json['quizes'] as List<dynamic>)
        .map((e) => Quiz.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuizResponseToJson(QuizResponse instance) =>
    <String, dynamic>{
      'quizes': instance.quizes,
    };

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    id: json['id'] as String,
    quizName: json['quiz_name'] as String,
    createdAt: json['created_at'] as String,
    author: json['author'] as String,
    code: json['code'] as String,
    quiz: (json['quiz'] as List<dynamic>)
        .map((e) => QuizTest.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'quiz_name': instance.quizName,
      'created_at': instance.createdAt,
      'author': instance.author,
      'code': instance.code,
      'quiz': instance.quiz,
    };

QuizTest _$QuizTestFromJson(Map<String, dynamic> json) {
  return QuizTest(
    question: json['question'] as String,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuizTestToJson(QuizTest instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    answer: json['answer'] as String,
    isTrue: json['is_true'] as bool,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'answer': instance.answer,
      'is_true': instance.isTrue,
    };
