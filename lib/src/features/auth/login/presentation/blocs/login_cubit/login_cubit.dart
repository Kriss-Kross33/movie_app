import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailInput(String emailString) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
        ]),
      ),
    );
  }

  void onPasswordInput(String passwordString) {
    final password = Password.dirty(passwordString);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
      ),
    );
  }

  void onLoginButtonPressed() async {
    if (!state.isValid) return;
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await _authenticationRepository.loginWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LoginWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.errorMessage,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void onLoginWithGoogleButtonPressed() async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await _authenticationRepository.loginWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LoginWithGoogleError catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.errorMessage,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
