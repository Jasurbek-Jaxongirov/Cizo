part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthenticateEvent extends AuthEvent {}

class GetProfilePhoto extends AuthEvent {}
