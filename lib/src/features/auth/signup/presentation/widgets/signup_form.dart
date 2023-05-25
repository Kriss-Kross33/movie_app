import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:movie_app/src/features/home/presentation/pages/pages.dart';

import '../../../../../core/core.dart';
import '../../../common/common.dart';
import '../blocs/blocs.dart';

part 'confirm_password_text_field.dart';
part 'email_text_field.dart';
part 'password_text_field.dart';
part 'signup_button.dart';
part 'username_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          print('Moving to Home Screen');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage ?? 'Failure: Unknown Error'),
              ),
            );
        } else {
          print(state.status);
        }
      },
      child: Column(
        children: [
          _UsernameTextField(),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          _EmailTextField(),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          _PasswordTextField(),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          _ConfirmPasswordTextField(),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          _SignupButton(
            width: MediaQuery.of(context).size.width,
            height: 50,
          ),
          SizedBox(
            height: Sizes.dimen_30.h,
          ),
        ],
      ),
    );
  }
}
