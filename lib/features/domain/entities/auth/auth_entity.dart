import 'package:equatable/equatable.dart';

class AuthenticationEntity extends Equatable {
  final String userId;

  const AuthenticationEntity({required this.userId});

  @override
  List<Object?> get props => [userId];
}
