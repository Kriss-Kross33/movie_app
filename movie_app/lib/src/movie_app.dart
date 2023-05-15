import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/language_constants.dart';
import 'package:movie_app/src/core/di/service_locator.dart';
import 'package:movie_app/src/core/localizations/app_localizations.dart';
import 'package:movie_app/src/core/themes/theme_text.dart';
import 'package:movie_app/src/core/wiredash/wiredash_widget.dart';
import 'package:movie_app/src/features/home/presentation/pages/home_screen.dart';
import 'package:movie_app/src/features/languages/presentation/bloc/language_bloc/language_bloc.dart';

import 'core/screenutil/screen_util_widget.dart';
import 'core/screenutil/screenutil.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _languageBloc = locator<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: () => BlocProvider<LanguageBloc>(
        create: (context) => _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoadedState) {
              return WiredashWidget(
                navigatorKey: _navigatorKey,
                languageCode: state.locale.languageCode,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: _navigatorKey,
                  title: 'Movie App',
                  theme: ThemeData(
                    unselectedWidgetColor: AppColor.royalBlue,
                    primaryColor: AppColor.vulcan,
                    scaffoldBackgroundColor: AppColor.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.royalBlue),
                  ),
                  supportedLocales: LanguageConstants.languages
                      .map((language) => Locale(language.code))
                      .toList(),
                  locale: state.locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  home: HomeScreen(),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
