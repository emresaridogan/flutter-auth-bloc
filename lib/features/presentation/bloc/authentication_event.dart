import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class PageStarted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}


class SignUpButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;
  SignUpButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;
  SignInButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOutButtonPressed extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
