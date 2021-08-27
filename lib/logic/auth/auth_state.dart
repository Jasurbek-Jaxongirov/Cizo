part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticating extends AuthState {}

class Authenticated extends AuthState {}

class FailedToAuthenticate extends AuthState {}

class GotProfilePhoto extends AuthState {}
