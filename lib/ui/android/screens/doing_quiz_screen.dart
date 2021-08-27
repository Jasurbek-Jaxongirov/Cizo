import 'package:cizo/data/model/quiz.dart';
import 'package:cizo/logic/bloc/bloc/play_quiz_bloc.dart';
import 'package:cizo/ui/android/screens/doing_quiz_done_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoingQuizScreen extends StatefulWidget {
  static const String routeName = '/doing-quiz';
  const DoingQuizScreen({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;

  @override
  _DoingQuizScreenState createState() => _DoingQuizScreenState();
}

class _DoingQuizScreenState extends State<DoingQuizScreen> {
  var _index = 0;
  var isChosen = false;
  var _selectedIndex = -1;
  var isCorrect = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final length = widget.quiz.quiz.length;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.primary,
        body: BlocBuilder<PlayQuizBloc, PlayQuizState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.quiz.code}-${widget.quiz.quizName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Constants.white),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Constants.white.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                '56:19',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Constants.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: Constants.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: Text(
                            '${widget.quiz.quiz[_index].question}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Constants.screen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: size.height * 0.658866995074,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (_, index) {
                              return SizedBox(
                                height: size.height * 0.031,
                              );
                            },
                            itemCount: widget.quiz.quiz[_index].answers.length,
                            itemBuilder: (_, index) {
                              return MaterialButton(
                                elevation: 1,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                color: _selectedIndex == index
                                    ? Constants.primary
                                    : Constants.screen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  _selectedIndex = index;

                                  isChosen = true;
                                  isCorrect = widget
                                      .quiz.quiz[_index].answers[index].isTrue;
                                  print(isCorrect);
                                  setState(() {});
                                },
                                child: Text(
                                  widget
                                      .quiz.quiz[_index].answers[index].answer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: _selectedIndex == index
                                              ? Constants.white
                                              : Colors.black),
                                ),
                              );
                            },
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color:
                              isChosen ? Constants.primary : Constants.screen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                width: isChosen ? 0 : 2,
                                color: Constants.dark.withOpacity(0.6),
                              )),
                          onPressed: () async {
                            if (!isChosen) {
                              return;
                            }
                            if (_index < length) {
                              _index += 1;
                            }
                            if (_index == length) {
                              _index = 0;
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => DoingQuizDoneScreen(
                                      quiz:
                                          '${widget.quiz.code}-${widget.quiz.quizName}'),
                                ),
                              );
                            }
                            _selectedIndex = -1;
                            setState(() {});
                            isChosen = false;
                            if (isCorrect) {
                              BlocProvider.of<PlayQuizBloc>(context,
                                      listen: false)
                                  .add(StartPlayingQuizEvent());
                            }
                          },
                          child: Text(
                            "Next",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: isChosen
                                        ? Constants.white
                                        : Constants.dark.withOpacity(0.6)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
