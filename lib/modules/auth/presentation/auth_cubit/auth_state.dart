// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticating extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated({
    required this.user,
  });
}

class UnAuthenticated extends AuthState {}
