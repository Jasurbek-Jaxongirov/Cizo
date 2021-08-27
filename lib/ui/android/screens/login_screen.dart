import 'package:cizo/ui/android/components/login_column.dart';
import 'package:cizo/ui/android/components/signup_column.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final mQ = MediaQuery.of(context);
    final height = mQ.size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Constants.primary,
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.16,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.0812,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                              width: 118.97,
                              height: 128,
                              top: -(height * 0.10),
                              child: Image.asset(
                                'assets/icons/onboarding_emoji_1.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          color: Constants.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: isLoggedIn ? Constants.primary : null,
                                onPressed: () {
                                  isLoggedIn = true;
                                  setState(() {});
                                },
                                child: Text(
                                  'Login',
                                  style: textTheme.headline3!.copyWith(
                                    color: isLoggedIn
                                        ? Constants.white
                                        : Constants.primary.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: isLoggedIn ? null : Constants.primary,
                                onPressed: () {
                                  isLoggedIn = false;
                                  setState(() {});
                                },
                                child: Text(
                                  'Sign Up',
                                  style: textTheme.headline3!.copyWith(
                                      color: isLoggedIn
                                          ? Constants.primary.withOpacity(0.6)
                                          : Constants.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: isLoggedIn
                              ? LoginColumn(textTheme: textTheme)
                              : SignUpForm(textTheme: textTheme),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
