part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class LoadQuiz extends QuizEvent {}

class ExpandSearchQuizButtonEvent extends QuizEvent {
  final bool isExpanded;
  ExpandSearchQuizButtonEvent(this.isExpanded);
}
