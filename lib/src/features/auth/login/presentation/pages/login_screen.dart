import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/common/widgets/layout/layout.dart';

import '../../../../../core/core.dart';
import '../blocs/blocs.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          if (ResponsiveLayout.isPhone(context))
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
                AssetConstants.movieBg2,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                fit: BoxFit.cover,
              ),
            )
          else if (ResponsiveLayout.isDesktop(context))
            Align(
              alignment: Alignment.topRight,
              child: Container(
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
                  AssetConstants.movieBg2,
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Positioned(
            top: constraints.maxHeight * 0.36,
            left: Sizes.dimen_16.w,
            right: Sizes.dimen_16.w,
            child: BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(
                authenticationRepository:
                    context.read<AuthenticationRepository>(),
              ),
              child: LoginForm(),
            ),
          ),
        ],
      );
    }));
  }
}
