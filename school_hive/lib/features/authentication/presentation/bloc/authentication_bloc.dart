import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:school_hive/features/authentication/domain/domain.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_auth_credential.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUsecase loginUsecase;

  AuthenticationBloc({
    required this.loginUsecase,
  }) : super(AuthState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthState());
    // Todo: call the usecase to send a login request to the backend
    final failureOrAuthCredential = await loginUsecase(
      LoginParams(email: event.email, password: event.password),
    );
    // Todo: based on the response send an error or success message
    emit(_eitherLoginOrError(failureOrAuthCredential));
  }

  // Todo: create a function that returns a success or failure response
  AuthenticationState _eitherLoginOrError(
      Either<Failure, UserAuthCredential> failureOrAuthCredential) {
    return failureOrAuthCredential.fold(
      (failure) => AuthState(
        status: Status.failure,
        authenticationStatus: AuthenticationStatus.authenticated,
      ),
      (authCredential) => AuthState(
        status: Status.loaded,
        authenticationStatus: AuthenticationStatus.authenticated,
      ),
    );
  }
}
