part of 'login_form.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextFormField(
          hintText: 'Enter email',
          errorText:
              state.email.displayError != null ? 'invalid password' : null,
          onChanged: (String emailString) =>
              context.read<LoginCubit>().onEmailInput(emailString),
        );
      },
    );
  }
}
