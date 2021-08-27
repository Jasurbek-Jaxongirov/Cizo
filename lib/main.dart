import 'package:cizo/data/model/quiz.dart';
import 'package:cizo/home.dart';
import 'package:cizo/logic/auth/auth_bloc.dart';
import 'package:cizo/logic/bloc/bloc/play_quiz_bloc.dart';
import 'package:cizo/ui/android/screens/doing_quiz_done_screen.dart';
import 'package:cizo/ui/android/screens/doing_quiz_screen.dart';
import 'package:cizo/ui/android/screens/login_screen.dart';
import 'package:cizo/ui/android/screens/public_quiz_screen.dart';
import 'package:cizo/ui/android/screens/screens.dart';
import 'package:cizo/ui/android/screens/setup_profile_screen.dart';
import 'package:cizo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/quiz_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc()..add(LoadQuiz()),
        ),
        BlocProvider<PlayQuizBloc>(
          create: (context) => PlayQuizBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cizo',
        theme: AppTheme.themeData(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => SplashScreen(),
          OnboardingScreen.routeName: (_) => OnboardingScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          SetupProfileScreen.routeName: (_) => SetupProfileScreen(),
          Home.routeName: (_) => Home(title: ''),
          PublicQuizScreen.routeName: (_) => PublicQuizScreen(),
          DoingQuizDoneScreen.routeName: (_) => DoingQuizDoneScreen(quiz: ''),
          DoingQuizScreen.routeName: (_) => DoingQuizScreen(
                quiz: Quiz(
                    id: '',
                    quizName: '',
                    createdAt: '',
                    author: '',
                    code: '',
                    quiz: []),
              ),
        },
      ),
    );
  }
}
