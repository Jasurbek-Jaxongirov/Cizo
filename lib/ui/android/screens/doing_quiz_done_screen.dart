import 'package:cizo/home.dart';
import 'package:cizo/logic/bloc/bloc/play_quiz_bloc.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoingQuizDoneScreen extends StatelessWidget {
  static const routeName = '/doing-quiz-done';
  const DoingQuizDoneScreen({Key? key, required this.quiz}) : super(key: key);
  final String quiz;
  @override
  Widget build(BuildContext context) {
    final score = BlocProvider.of<PlayQuizBloc>(context).score;
    final size = MediaQuery.of(context).size;
    final text = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.primary,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    quiz,
                    style: text.headline5!.copyWith(color: Constants.white),
                  ),
                  Container(
                    width: 280,
                    height: 152,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'assets/icons/congrats.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 61,
                    width: 137,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Constants.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '$score',
                          style: text.headline4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Constants.screen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              height: size.height * 0.49384236,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    score == 0 ? 'Failure!' : 'Congratulations!',
                    textAlign: TextAlign.center,
                    style: text.headline2!.copyWith(color: Constants.dark),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'You got ',
                        style: text.bodyText1!
                            .copyWith(fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: '$score',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' points and you are on the '),
                          TextSpan(
                            text: ' 6th ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  ' place on this quiz leaderboard, keep it up!')
                        ]),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Constants.primary,
                    onPressed: () {},
                    child: Text(
                      'View Leaderboard',
                      style: text.headline5!.copyWith(color: Constants.white),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Constants.primary.withOpacity(0.10),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routeName);
                      BlocProvider.of<PlayQuizBloc>(context).score = 0;
                    },
                    child: Text(
                      'Back to Home',
                      style: text.headline5!.copyWith(color: Constants.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
