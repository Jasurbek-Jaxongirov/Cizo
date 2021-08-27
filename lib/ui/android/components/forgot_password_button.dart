import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'login_column.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final LoginColumn widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: widget.textTheme.headline5!.copyWith(
                color: Constants.primary, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
