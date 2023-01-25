import 'package:authentication_bloc/features/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> getCurrentUser();

  Future<Either<Failure, AuthenticationEntity>> signUp(
      String email, String password);

  Future<Either<Failure, AuthenticationEntity>> signIn(
      String email, String password);

  Future<Either<Failure, bool>> signOut();

}
