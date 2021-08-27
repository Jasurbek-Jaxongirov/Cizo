import 'package:cizo/home.dart';
import 'package:cizo/ui/android/screens/setup_profile_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'forgot_password_button.dart';

class LoginColumn extends StatefulWidget {
  const LoginColumn({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  _LoginColumnState createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    Constants.isLoginActivated = false;
    emailController.dispose();
    passwordController.dispose();
  }

  void _activate() {
    if (passwordController.text.length >= 8 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      Constants.isLoginActivated = true;
    } else {
      Constants.isLoginActivated = false;
    }
    setState(() {});
  }

  void _saveForm() {
    final isValidated = _formKey.currentState!.validate();
    if (!isValidated) {
      return;
    }

    _formKey.currentState!.save();
    emailController.clear();
    passwordController.clear();
    Navigator.of(context).pushNamed(SetupProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        widget.textTheme.bodyText2!.copyWith(color: Constants.dark);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'E-mail Address',
              style: textStyle,
            ),
          ),
          TextFormField(
            onChanged: (_) {
              _activate();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value == '') {
                return 'Email is required';
              }
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Email is invalid';
              }
            },
            controller: emailController,
            decoration: Constants.inputDecoration(
                Icons.mail_outline_outlined, 'Enter your e-mail address'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'Password',
              style: textStyle,
            ),
          ),
          TextFormField(
            onChanged: (_) {
              _activate();
            },
            controller: passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value == '') {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least eight characters long';
              }
            },
            obscureText: Constants.isLoginPasswordHidden,
            decoration: Constants.inputDecoration(
              Icons.lock_outlined,
              'Enter account password',
              IconButton(
                onPressed: () {
                  Constants.isLoginPasswordHidden =
                      !Constants.isLoginPasswordHidden;
                  setState(() {});
                },
                icon: Icon(Constants.isLoginPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Color(0XFFA9A9A9),
              ),
            ),
          ),
          ForgotPasswordButton(widget: widget),
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            color: Constants.isLoginActivated
                ? Constants.primary
                : Constants.white,
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: Constants.isLoginActivated ? 0 : 1,
                color: Constants.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            onPressed: () {
              // await showDialog(
              //   barrierDismissible: true,
              //   barrierColor: Constants.grey.withOpacity(0.10),
              //   useSafeArea: true,
              //   context: context,
              //   builder: (_) {
              //     return Center(
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: Constants.white,
              //         ),
              //         width: 80,
              //         height: 80,
              //         padding: const EdgeInsets.all(20),
              //         child: CircularProgressIndicator(
              //           strokeWidth: 2,
              //           backgroundColor: Constants.grey,
              //           color: Constants.primary,
              //         ),
              //       ),
              //     );
              //   },
              // );
              _saveForm();
              Navigator.of(context).pushReplacementNamed(Home.routeName);
            },
            child: Text(
              'Login',
              style: widget.textTheme.headline3!.copyWith(
                  color: Constants.isLoginActivated
                      ? Constants.white
                      : Constants.grey),
            ),
          ),
        ],
      ),
    );
  }
}
