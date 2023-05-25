import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(SignupState());

  final AuthenticationRepository _authenticationRepository;

  void onUsernameInput(String input) {
    final username = Username.dirty(input);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void onEmailInput(String input) {
    final email = Email.dirty(input);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.username,
          email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void onPasswordInput(String input) {
    final password = Password.dirty(input);
    final confirmPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [
            state.username,
            state.email,
            password,
            confirmPassword,
          ],
        ),
      ),
    );
  }

  void onConfirmPasswordInput(String input) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: input,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
          [
            state.username,
            state.email,
            state.password,
            confirmPassword,
          ],
        ),
      ),
    );
  }

  void onSignupButtonPressed() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.signup(
        email: state.email.value,
        password: state.password.value,
        username: state.username.value,
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
      print('USER CREATED SUCCESSFULLY');
    } on SignupWithEmailAndPasswordError catch (e) {
      print('THERE WAS AN Error');
      emit(
        state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: e.errorMessage),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
