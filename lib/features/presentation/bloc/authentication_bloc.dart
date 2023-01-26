import 'package:authentication_bloc/features/domain/usecases/auth/sign_in_usecase.dart';
import 'package:authentication_bloc/features/domain/usecases/auth/sign_out_usecase.dart';
import 'package:authentication_bloc/features/domain/usecases/auth/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SignInUseCase signInUseCase = SignInUseCase();
  SignUpUseCase signUpUseCase = SignUpUseCase();
  SignOutUseCase signOutUseCase = SignOutUseCase();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await signUpUseCase.call(
            SignUpUseCaseParams(email: event.email, password: event.password));
        emit(AuthenticationSuccess());
      } catch (error) {
        emit(AuthFailure(error: error.toString()));
      }
    });
  }
}
