import 'package:cizo/logic/bloc/quiz_bloc.dart';
import 'package:cizo/ui/android/pages/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ui/android/pages/home_body.dart';
import 'ui/android/screens/public_quiz_screen.dart';
import 'ui/theme/app_constants.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;
  static const String routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context);
    final size = mQ.size;
    final remainingHeight =
        size.height - size.height * 0.134236453202 - mQ.padding.top;
    final textStyle = Theme.of(context).textTheme;

    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc()..add(LoadQuiz()),
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constants.isProfile
                  ? ProfileBody(
                      remainingSize: remainingHeight,
                      size: size,
                    )
                  : HomeBody(
                      size: size,
                      remainingHeight: remainingHeight,
                      textStyle: textStyle),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: size.width,
                height: size.height * 0.134236453202,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Positioned(
                      left: size.width * 0.15666,
                      child: InkWell(
                        onTap: () {
                          Constants.isProfile = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            'assets/icons/home.svg',
                            color: Constants.isProfile
                                ? Color(0xFF323438)
                                : Constants.primary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 58,
                      left: size.width * 0.4106667,
                      child: InkWell(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (ctx) {
                                return CustomShowDialog(
                                  size: size,
                                  ctx: ctx,
                                );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                              color: Constants.primary,
                              borderRadius: BorderRadius.circular(23)),
                          child: SvgPicture.asset(
                            'assets/icons/button-explore.svg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.77333333,
                      child: InkWell(
                        onTap: () {
                          Constants.isProfile = true;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            'assets/icons/person.svg',
                            color: Constants.isProfile
                                ? Constants.primary
                                : Color(0xFF323438),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({
    Key? key,
    required this.size,
    required this.ctx,
  }) : super(key: key);

  final Size size;
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          bottom: size.height * 0.1874,
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            actionsPadding: const EdgeInsets.all(0),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Container(
                decoration: BoxDecoration(
                    color: null,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/icons/home_menu_button_shaped_background.png'))),
                height: 136,
                // width: size.width - 50,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        final bloc = BlocProvider.of<QuizBloc>(context);
                        Navigator.of(ctx).pop();
                        bloc.setIsExpanded = true;
                        bloc.add(ExpandSearchQuizButtonEvent(true));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/search.svg'),
                          SizedBox(height: 10),
                          Text('Find Quiz Code'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(ctx).pop();
                        Navigator.of(context)
                            .pushNamed(PublicQuizScreen.routeName);
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.of(ctx).pop();
                          Navigator.of(context)
                              .pushNamed(PublicQuizScreen.routeName);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // color: Constants.dark.withOpacity(0.80)
                            SvgPicture.asset('assets/icons/list.svg'),
                            SizedBox(height: 10),
                            Text('Find Public Quiz'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
