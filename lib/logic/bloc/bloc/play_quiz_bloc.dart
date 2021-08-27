import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_quiz_event.dart';
part 'play_quiz_state.dart';

class PlayQuizBloc extends Bloc<PlayQuizEvent, PlayQuizState> {
  PlayQuizBloc() : super(PlayQuizInitial());
  int score = 0;

  @override
  Stream<PlayQuizState> mapEventToState(
    PlayQuizEvent event,
  ) async* {
    print('Before $score');
    if (event is StartPlayingQuizEvent) {
      score += 400;
      print('After $score');
      yield ScoreAddedState();
    }
  }
}
