part of 'signup_form.dart';

class _ConfirmPasswordTextField extends StatefulWidget {
  const _ConfirmPasswordTextField();

  @override
  State<_ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<_ConfirmPasswordTextField> {
  late bool hidePassword;
  @override
  void initState() {
    hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return AuthTextFormField(
          hintText: 'Confirm password',
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
          obscureText: hidePassword,
          errorText: state.confirmPassword.displayError != null
              ? 'passwords do not match'
              : null,
          onChanged: (String passwordString) => context
              .read<SignupCubit>()
              .onConfirmPasswordInput(passwordString),
        );
      },
    );
  }
}
