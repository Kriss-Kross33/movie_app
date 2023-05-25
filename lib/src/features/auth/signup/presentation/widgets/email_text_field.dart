part of 'signup_form.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextFormField(
          hintText: 'Enter email',
          errorText: state.email.displayError != null ? 'invalid email' : null,
          onChanged: (String emailString) =>
              context.read<SignupCubit>().onEmailInput(emailString),
        );
      },
    );
  }
}
