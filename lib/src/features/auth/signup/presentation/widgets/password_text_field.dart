part of 'signup_form.dart';

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField();

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  late bool hidePassword;
  @override
  void initState() {
    hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AuthTextFormField(
          hintText: 'Enter password',
          obscureText: hidePassword,
          suffixIcon: IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: AppColor.violet,
            ),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),
          errorText:
              state.password.displayError != null ? 'invalid password' : null,
          onChanged: (String passwordString) =>
              context.read<SignupCubit>().onPasswordInput(passwordString),
        );
      },
    );
  }
}
