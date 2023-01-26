import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthFailure extends AuthenticationState {
  String error;
  AuthFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
