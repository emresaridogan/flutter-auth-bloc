import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../locator.dart';
import '../../domain/entities/auth/auth_entity.dart';
import '../../domain/repository/authentication_repository.dart';
import '../datasources/authentication_service.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationService authenticationService =
      locator<AuthenticationServiceImpl>();

  @override
  Future<Either<Failure, AuthenticationEntity>> getCurrentUser() {
    return _getCurrentUser();
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    return _signOut();
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> signIn(
      String email, String password) {
    return _signIn(email, password);
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> signUp(
      String email, String password) {
    return _signUp(email, password);
  }

  Future<Either<Failure, AuthenticationEntity>> _getCurrentUser() async {
    try {
      AuthenticationEntity authenticationEntity =
          authenticationService.getCurrentUser();
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<Either<Failure, bool>> _signOut() async {
    try {
      bool logOutBool = await authenticationService.signOut();
      return Right(logOutBool);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<Either<Failure, AuthenticationEntity>> _signIn(
      String email, String password) async {
    try {
      AuthenticationEntity authenticationEntity =
          await authenticationService.signIn(email, password);
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<Either<Failure, AuthenticationEntity>> _signUp(
      String email, String password) async {
    try {
      AuthenticationEntity authenticationEntity =
          await authenticationService.signUp(email, password);
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }
}
