import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../auth.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.7),
                  Theme.of(context).primaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Image.asset(
              AssetConstants.movieBg,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: constraints.maxHeight * 0.36,
            left: Sizes.dimen_16.w,
            right: Sizes.dimen_16.w,
            child: BlocProvider<SignupCubit>(
              create: (context) => SignupCubit(
                authenticationRepository:
                    context.read<AuthenticationRepository>(),
              ),
              child: SignupForm(),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return LoginScreen();
                    //     },
                    //   ),
                    // );
                  },
                  child: Text(
                    'Log in',
                    style: Theme.of(context).textTheme.violetBodyLargeText,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}
