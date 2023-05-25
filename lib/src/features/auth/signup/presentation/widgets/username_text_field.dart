part of 'signup_form.dart';

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return AuthTextFormField(
          hintText: 'Enter username',
          errorText:
              state.username.displayError != null ? 'invalid username' : null,
          onChanged: (String usernameString) =>
              context.read<SignupCubit>().onUsernameInput(usernameString),
        );
      },
    );
  }
}
