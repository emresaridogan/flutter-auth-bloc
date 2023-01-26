import 'package:authentication_bloc/features/domain/repository/authentication_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../../../data/repository/authentication_repository_impl.dart';
import '../../entities/auth/auth_entity.dart';

class SignUpUseCase extends UseCase<AuthenticationEntity, SignUpUseCaseParams> {
  AuthenticationRepository authenticationRepository =
      locator<AuthenticationRepositoryImpl>();

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SignUpUseCaseParams params) {
    return authenticationRepository.signUp(params.email, params.password);
  }
}

class SignUpUseCaseParams extends Equatable {
  final String email;
  final String password;

  const SignUpUseCaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
