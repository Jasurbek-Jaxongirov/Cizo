part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class LoadingQuizState extends QuizState {}

class LoadedQuizState extends QuizState {
  final List<Quiz> quiz;
  LoadedQuizState({required this.quiz});
}

class FailedToLoadQuizState extends QuizState {
  final Object error;
  FailedToLoadQuizState({required this.error});
}

// Expanding search quiz button

class ExpandingSearchQuizButton extends QuizState {}

class ShrinkingSearchQuizButton extends QuizState {}
