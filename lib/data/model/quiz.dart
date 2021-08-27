import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class QuizResponse {
  List<Quiz> quizes;

  QuizResponse({required this.quizes});

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuizResponseToJson(this);
}

@JsonSerializable()
class Quiz {
  String id;
  @JsonKey(name: 'quiz_name')
  String quizName;
  @JsonKey(name: 'created_at')
  String createdAt;
  String author;
  String code;
  List<QuizTest> quiz;

  Quiz({
    required this.id,
    required this.quizName,
    required this.createdAt,
    required this.author,
    required this.code,
    required this.quiz,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class QuizTest {
  String question;
  List<Answer> answers;

  QuizTest({
    required this.question,
    required this.answers,
  });

  factory QuizTest.fromJson(Map<String, dynamic> json) =>
      _$QuizTestFromJson(json);
  Map<String, dynamic> toJson() => _$QuizTestToJson(this);
}

@JsonSerializable()
class Answer {
  String answer;
  @JsonKey(name: 'is_true')
  bool isTrue;

  Answer({
    required this.answer,
    required this.isTrue,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
