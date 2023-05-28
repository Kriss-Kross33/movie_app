import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../../home/presentation/pages/home_screen.dart';
import '../../../auth.dart';
import '../../../common/common.dart';

part 'email_text_field.dart';
part 'login_button.dart';
part 'password_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
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
        }
      },
      child: Column(
        children: [
          _EmailTextField(),
          SizedBox(
            height: Sizes.dimen_10.h,
          ),
          _PasswordTextField(),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Forgot password?',
                style: Theme.of(context).textTheme.violetBodyLargeText,
              ),
            ),
          ),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          _LoginButton(
            width: MediaQuery.of(context).size.width,
            height: 50,
          ),
          SizedBox(
            height: Sizes.dimen_30.h,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  height: 1,
                  color: AppColor.royalBlue,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
                child: Text('Or'),
              ),
              Expanded(
                child: Divider(
                  height: 1,
                  color: AppColor.royalBlue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizes.dimen_30.h,
          ),
          InkWell(
            onTap: () {
              context.read<LoginCubit>().onLoginWithGoogleButtonPressed();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: ContainerBorderGradient(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.royalBlue,
                      AppColor.violet,
                    ],
                  ),
                  borderWidth: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                    width: Sizes.dimen_30.w,
                    height: Sizes.dimen_30.w,
                  ),
                  SizedBox(
                    width: Sizes.dimen_8.w,
                  ),
                  Text(
                    'Sign in with Google',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: ContainerBorderGradient(
                gradient: LinearGradient(
                  colors: [
                    AppColor.royalBlue,
                    AppColor.violet,
                  ],
                ),
                borderWidth: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: Sizes.dimen_8.w,
                ),
                Text(
                  'Sign in with Facebook',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          SizedBox(
            height: Sizes.dimen_10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Create one?',
                  style: Theme.of(context).textTheme.violetBodyLargeText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
