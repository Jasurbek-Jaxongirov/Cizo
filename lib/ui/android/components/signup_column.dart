import 'package:cizo/ui/android/screens/setup_profile_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _activate() {
    Constants.isSignupActivated = false;
    if (fullnameController.text.length >= 3 &&
        passwordController.text.length >= 8 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      Constants.isSignupActivated = true;
    }
    setState(() {});
  }

  void _saveForm() {
    final isValidated = _formKey.currentState!.validate();
    if (!isValidated) {
      return;
    }
    _formKey.currentState!.save();
    fullnameController.clear();
    emailController.clear();
    passwordController.clear();

    Navigator.of(context).pushNamed(SetupProfileScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    Constants.isSignupActivated = false;
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'Full Name',
              style:
                  widget.textTheme.bodyText2!.copyWith(color: Constants.dark),
            ),
          ),
          TextFormField(
            controller: fullnameController,
            onChanged: (_) {
              _activate();
            },
            validator: (value) {
              if (value == '' || value == null) {
                return 'Name is required!';
              } else if (value.length <= 3) {
                return 'Name must be more than three characters';
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: Constants.inputSignUpDecoration(
                fullname: 'Enter your full name',
                prefixIcon: Icons.person_outline_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'E-mail Address',
              style:
                  widget.textTheme.bodyText2!.copyWith(color: Constants.dark),
            ),
          ),
          TextFormField(
            controller: emailController,
            onChanged: (_) {
              _activate();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value == '') {
                return 'Email is required';
              }
              final email = value;
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email)) {
                return 'Email is invalid';
              }
            },
            decoration: Constants.inputSignUpDecoration(
              fullname: 'Enter your e-mail address',
              prefixIcon: Icons.mail_outline_outlined,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'Password',
              style:
                  widget.textTheme.bodyText2!.copyWith(color: Constants.dark),
            ),
          ),
          TextFormField(
            controller: passwordController,
            onChanged: (_) {
              _activate();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value == '') {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least eight characters long';
              }
            },
            obscureText: Constants.isSignupPasswordHidden,
            decoration: Constants.inputSignUpDecoration(
              fullname: 'Create account password',
              prefixIcon: Icons.lock_outlined,
              suffix: IconButton(
                  onPressed: () {
                    Constants.isSignupPasswordHidden =
                        !Constants.isSignupPasswordHidden;
                    setState(() {});
                  },
                  icon: Icon(Constants.isSignupPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: Color(0XFFA9A9A9)),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          MaterialButton(
            color: Constants.isSignupActivated
                ? Constants.primary
                : Constants.white,
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: Constants.isSignupActivated ? 0 : 1,
                color: Constants.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            onPressed: () async {
              await showDialog(
                barrierDismissible: true,
                barrierColor: Constants.grey.withOpacity(0.10),
                useSafeArea: true,
                context: context,
                builder: (_) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constants.white,
                      ),
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Constants.grey,
                        color: Constants.primary,
                      ),
                    ),
                  );
                },
              );
              _saveForm();
            },
            child: Text(
              'Sign Up',
              style: widget.textTheme.headline3!.copyWith(
                  color: Constants.isSignupActivated
                      ? Constants.white
                      : Constants.grey),
            ),
          ),
        ],
      ),
    );
  }
}
