import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  File? _image;

  set setFile(file) {
    _image = file;
  }

  File? get getFile {
    return _image;
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is GetProfilePhoto) {
      yield GotProfilePhoto();
    }
  }
}
