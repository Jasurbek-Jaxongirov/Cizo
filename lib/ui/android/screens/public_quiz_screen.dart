// import 'package:cizo/data/model/quiz.dart';
import 'package:cizo/logic/bloc/quiz_bloc.dart';
import 'package:cizo/ui/android/components/quiz_item.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicQuizScreen extends StatefulWidget {
  const PublicQuizScreen({Key? key}) : super(key: key);
  static const String routeName = '/public-quiz';

  @override
  _PublicQuizScreenState createState() => _PublicQuizScreenState();
}

class _PublicQuizScreenState extends State<PublicQuizScreen> {
  var isAll = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc()..add(LoadQuiz()),
      child: Scaffold(
        backgroundColor: Constants.screen,
        appBar: AppBar(
          backgroundColor: Constants.screen,
          elevation: 0,
          iconTheme: IconThemeData(color: Constants.dark),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Public Quiz',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Constants.dark),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 54,
                        color: isAll ? Constants.primary : null,
                        onPressed: () {
                          isAll = true;
                          setState(() {});
                        },
                        child: Text(
                          'All',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: isAll
                                        ? Constants.white
                                        : Constants.dark.withOpacity(0.60),
                                  ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 54,
                        color: isAll ? null : Constants.primary,
                        onPressed: () {
                          isAll = false;
                          setState(() {});
                        },
                        child: Text(
                          'Recent',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: isAll
                                      ? Constants.dark.withOpacity(0.60)
                                      : Constants.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<QuizBloc, QuizState>(
                  builder: (context, state) {
                    if (state is LoadingQuizState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is LoadedQuizState) {
                      final quizList =
                          BlocProvider.of<QuizBloc>(context).getQuiz;
                      return ListView.builder(
                          itemCount: quizList.length,
                          itemBuilder: (_, index) =>
                              QuizItem(quizList: quizList[index]));
                    }
                    if (state is FailedToLoadQuizState) {
                      return Center(
                        child: Text('Internal error occured'),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
