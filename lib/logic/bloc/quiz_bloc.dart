import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cizo/data/model/quiz.dart';
import 'package:cizo/data/service/mock_json_service.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial());
  List<Quiz> _mockQuiz = [];
  bool _isExpanded = false;
  List<Quiz> get getQuiz {
    return [..._mockQuiz];
  }

  set setQuiz(mockQuiz) {
    _mockQuiz = mockQuiz;
  }

  bool get getIsExpanded {
    return _isExpanded;
  }

  set setIsExpanded(bool value) {
    _isExpanded = value;
  }

  Future<void> getQuizes() async {
    setQuiz = await MockCizoService().getQuizResponse();
  }

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is LoadQuiz) {
      yield LoadingQuizState();
      await getQuizes();
      try {
        yield LoadedQuizState(quiz: getQuiz);
      } catch (error) {
        yield FailedToLoadQuizState(error: error);
      }
    }
    if (event is ExpandSearchQuizButtonEvent) {
      if (getIsExpanded) {
        yield ExpandingSearchQuizButton();
      } else {
        yield ShrinkingSearchQuizButton();
      }
    }
  }
}
