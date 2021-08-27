import 'dart:io';

import 'package:cizo/logic/auth/auth_bloc.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.remainingSize, required this.size})
      : super(key: key);
  final double remainingSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    Constants.imageFile = null;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: remainingSize,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileImage(size: size),
              Container(
                width: size.width * 0.866667,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.white),
                child: Row(
                  children: [
                    ProfileIconContainer(
                      iconData: Icons.person_outline,
                    ),
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Constants.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.866667,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.white),
                child: Row(
                  children: [
                    ProfileIconContainer(
                      iconData: Icons.lock_outline,
                    ),
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Constants.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.866667,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.white),
                child: Row(
                  children: [
                    ProfileIconContainer(iconData: Icons.logout),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Constants.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ImageSource? source;
  Future<void> pickImage() async {
    var imagePicked;
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
    if (source == null) {
      return;
    }
    imagePicked = await ImagePicker().pickImage(source: source!);

    if (imagePicked == null) {
      return;
    }

    BlocProvider.of<AuthBloc>(context).setFile = File(imagePicked.path);

    setState(() {});
    BlocProvider.of<AuthBloc>(context).add(GetProfilePhoto());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Constants.white,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    width: 115,
                    height: 115,
                    top: 2.5,
                    left: 2.5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            BlocProvider.of<AuthBloc>(context).getFile != null
                                ? null
                                : Constants.primary.withOpacity(0.10),
                      ),
                      child: BlocProvider.of<AuthBloc>(context).getFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.file(
                                BlocProvider.of<AuthBloc>(context).getFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              color: Constants.primary.withOpacity(0.20),
                              size: 80,
                            ),
                    )),
                Positioned(
                  width: 50,
                  height: 50,
                  bottom: -25,
                  left: 35,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Constants.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: pickImage,
                      icon: Icon(
                        Constants.imageFile != null
                            ? Icons.camera_alt_outlined
                            : Icons.add,
                        color: Constants.primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            'Robert Fodie',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Constants.dark),
          ),
          SizedBox(
            height: widget.size.height * 0.025,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            width: widget.size.width * 0.605333,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Constants.primary.withOpacity(0.10),
            ),
            child: Text(
              'robert12fodie@gmail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600, color: Constants.primary),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileIconContainer extends StatelessWidget {
  const ProfileIconContainer({
    Key? key,
    required this.iconData,
  }) : super(key: key);
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Constants.primary.withOpacity(0.10)),
      child: Icon(
        iconData,
        color: Constants.primary,
      ),
    );
  }
}
