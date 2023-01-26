import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../../../data/repository/authentication_repository_impl.dart';
import '../../repository/authentication_repository.dart';

class SignOutUseCase extends UseCase<bool, NoParams> {
  AuthenticationRepository authenticationRepository =
      locator<AuthenticationRepositoryImpl>();

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return authenticationRepository.signOut();
  }
}
