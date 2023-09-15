part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class Unauthenticated extends AuthState {}
class Authenticated extends AuthState {}
class Authenticating extends AuthState {}

class AuthenticationFailed extends AuthState {
  AuthenticationFailed({required this.exception});
  final dynamic exception;
}
