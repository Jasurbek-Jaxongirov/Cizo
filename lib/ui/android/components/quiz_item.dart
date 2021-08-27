import 'dart:math';

import 'package:cizo/data/model/quiz.dart';
import 'package:cizo/ui/android/screens/doing_quiz_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

class QuizItem extends StatelessWidget {
  const QuizItem({
    Key? key,
    required this.quizList,
  }) : super(key: key);

  final Quiz quizList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => DoingQuizScreen(quiz: quizList)));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 25),
        height: 110,
        width: MediaQuery.of(context).size.width * 0.8667,
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: ListTile(
          leading: Image.asset(
              'assets/icons/random_illustration_${1 + Random().nextInt(3)}.png'),
          title: Text(quizList.quizName),
          subtitle: Text(quizList.code),
        ),
      ),
    );
  }
}
