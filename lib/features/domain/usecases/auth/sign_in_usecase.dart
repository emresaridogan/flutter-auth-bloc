import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../../../data/repository/authentication_repository_impl.dart';
import '../../entities/auth/auth_entity.dart';
import '../../repository/authentication_repository.dart';

class SignInUseCase extends UseCase<AuthenticationEntity, SignInUseCaseParams> {
  AuthenticationRepository authenticationRepository =
      locator<AuthenticationRepositoryImpl>();

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SignInUseCaseParams params) {
    return authenticationRepository.signIn(params.email, params.password);
  }
}

class SignInUseCaseParams extends Equatable {
  final String email;
  final String password;

  const SignInUseCaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
