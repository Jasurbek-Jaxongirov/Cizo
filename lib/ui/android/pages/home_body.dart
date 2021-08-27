import 'package:cizo/logic/bloc/quiz_bloc.dart';
import 'package:cizo/ui/android/components/quiz_item.dart';
// import 'package:cizo/ui/android/screens/doing_quiz_screen.dart';
import 'package:cizo/ui/android/screens/public_quiz_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatefulWidget {
  HomeBody({
    Key? key,
    required this.size,
    required this.remainingHeight,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final double remainingHeight;
  final TextTheme textStyle;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final controller = TextEditingController();
  var isPrefixVisible = true;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var isExpanded = BlocProvider.of<QuizBloc>(context).getIsExpanded;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(),
        width: widget.size.width,
        child: SingleChildScrollView(
          child: Container(
            height: widget.remainingHeight,
            child: Column(
              children: [
                Container(
                  height: widget.size.height * 0.458128078818, // 0.5776

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: widget.size.height * 0.036945812808),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Constants.white),
                          width: widget.size.width * 0.4833,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/icons/little_shake_hand.png'),
                              RichText(
                                text: TextSpan(
                                  text: 'Hello, ',
                                  style: widget.textStyle.headline5!
                                      .copyWith(fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                        text: 'Robert!',
                                        style: widget.textStyle.headline5)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Constants.primary,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              scale: 1.0,
                              repeat: ImageRepeat.noRepeat,
                              image: AssetImage('assets/icons/background.png'),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Find Quiz Code',
                                style: widget.textStyle.headline4!
                                    .copyWith(color: Constants.white),
                              ),
                              Text(
                                'Enter quiz code that given by teacher, and you can start gathering points!',
                                style: widget.textStyle.bodyText2!.copyWith(
                                    fontSize: 14, color: Constants.white),
                              ),
                              TextField(
                                onChanged: (_) {
                                  print(controller.text.length);
                                  if (controller.text.length > 0) {
                                    isPrefixVisible = false;
                                  } else if (controller.text.length == 0) {
                                    isPrefixVisible = true;
                                  }
                                  setState(() {});
                                },
                                controller: controller,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText: 'Search quiz code',
                                  hintStyle: widget.textStyle.bodyText1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Constants.dark.withOpacity(0.40)),
                                  prefixIcon: isPrefixVisible
                                      ? null
                                      : Icon(Icons.search,
                                          color: Color(0xFFA9A9A9)),
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, bottom: 25, left: 15, right: 15),
                                  suffix: InkWell(
                                    onTap: () {
                                      controller.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 22.66,
                                      color: Color(0xFFA9A9A9),
                                    ),
                                  ),
                                  enabled: true,
                                  filled: true,
                                  fillColor: Constants.white,
                                  border: OutlineInputBorder(
                                    gapPadding: 0,
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    gapPadding: 0,
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HomeBodyBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBodyBottom extends StatelessWidget {
  const HomeBodyBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Public Quiz',
                style: Theme.of(context).textTheme.headline4,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(PublicQuizScreen.routeName);
                },
                child: SvgPicture.asset(
                  'assets/icons/arrow-right.svg',
                  color: Constants.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is LoadingQuizState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoadedQuizState) {
                  final quizList = BlocProvider.of<QuizBloc>(context).getQuiz;
                  return ListView.builder(
                    itemCount: quizList.length,
                    itemBuilder: (_, index) =>
                        QuizItem(quizList: quizList[index]),
                  );
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
    ));
  }
}
