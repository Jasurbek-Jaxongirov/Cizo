import 'dart:io';

import 'package:cizo/home.dart';
import 'package:cizo/logic/auth/auth_bloc.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfileScreen extends StatefulWidget {
  static const String routeName = '/setup-profile';
  const SetupProfileScreen({Key? key}) : super(key: key);

  @override
  _SetupProfileScreenState createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final mQ = MediaQuery.of(context);
    final height = mQ.size.height;
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
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Positioned(
                              width: 118.97,
                              height: 128,
                              top: -(height * 0.10),
                              child: Image.asset(
                                'assets/icons/rocket.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SetupProfileTitle(),
                              ProfilePhotoPicker(height: height),
                              RegionContainer(height: height),
                              ConfirmButton()
                            ],
                          ),
                        ),
                      ),
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

class SetupProfileTitle extends StatelessWidget {
  const SetupProfileTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Setting Up Your Profile",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Constants.dark),
        )
      ],
    );
  }
}

class RegionContainer extends StatelessWidget {
  const RegionContainer({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.067438),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Region"),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFC5C5C5).withOpacity(0.20),
                      offset: Offset(0, 7))
                ]),
            padding: EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset("assets/icons/indonesia.svg"),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Indonesia',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                          text: '+62',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Constants.dark.withOpacity(0.90)))
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right_alt,
                  color: Constants.primary,
                  size: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Constants.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(Home.routeName);
      },
      child: Text(
        "Confirm",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Constants.white),
      ),
    );
  }
}

class ProfilePhotoPicker extends StatefulWidget {
  const ProfilePhotoPicker({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  _ProfilePhotoPickerState createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  var isImagePicked = false;
  ImageSource source = ImageSource.camera;
  // File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(
              bottom: widget.height * 0.03078, top: widget.height * 0.067),
          width: 140,
          height: 140,
          decoration: BoxDecoration(
              color: Constants.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(40)),
          child: isImagePicked &&
                  BlocProvider.of<AuthBloc>(context).getFile != null
              ? Image.file(
                  BlocProvider.of<AuthBloc>(context).getFile!,
                  fit: BoxFit.cover,
                )
              : Icon(
                  Icons.photo_camera_outlined,
                  size: 33.75,
                  color: Constants.primary,
                ),
        ),
        TextButton(
          onPressed: () async {
            final imagePicked;
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Choose a source to pick an image!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      source = ImageSource.gallery;
                      Navigator.of(ctx).pop();
                    },
                    child: Text("From Gallery"),
                  ),
                  TextButton(
                    onPressed: () {
                      source = ImageSource.camera;
                      Navigator.of(ctx).pop();
                    },
                    child: Text("From Camera"),
                  ),
                ],
              ),
            );
            imagePicked = await ImagePicker().pickImage(source: source);

            if (imagePicked == null) {
              return;
            }

            Constants.imageFile = File(imagePicked.path);
            BlocProvider.of<AuthBloc>(context, listen: false).setFile =
                File(imagePicked.path);
            BlocProvider.of<AuthBloc>(context).add(GetProfilePhoto());
            isImagePicked = true;
            setState(() {});
          },
          child: Text(
            isImagePicked ? "Change Profile Picture" : "Add Profile Picture",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                color: isImagePicked
                    ? Constants.dark.withOpacity(0.40)
                    : Constants.primary),
          ),
        ),
      ],
    );
  }
}
