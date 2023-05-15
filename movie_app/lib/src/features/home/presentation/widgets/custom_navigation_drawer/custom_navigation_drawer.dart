import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/constants/language_constants.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/constants/translation_constants.dart';
import 'package:movie_app/src/features/about/presentation/widgets/app_dialog.dart';
import 'package:movie_app/src/features/home/presentation/widgets/custom_navigation_drawer/custom_navigation_drawer_list_item.dart';
import 'package:movie_app/src/features/home/presentation/widgets/custom_navigation_drawer/custom_navigation_drawer_sublist_item.dart';
import 'package:movie_app/src/features/home/presentation/widgets/custom_navigation_drawer/custon_navigation_drawer_expanded_list_tile.dart';
import 'package:movie_app/src/features/home/presentation/widgets/logo_widget.dart';
import 'package:movie_app/src/features/languages/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/extensions/string_extensions.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
              ),
              child: LogoWidget(
                height: Sizes.dimen_20.h,
              ),
            ),
            CustomNavigationDrawerListItem(
              title: TranslationConstants.FAVOURITEMOVIES.translate(context) ??
                  TranslationConstants.FAVOURITEMOVIES,
              onPressed: () {},
            ),
            CustomNavigationDrawerExpandedListTile(
              title: TranslationConstants.LANGUAGES.translate(context) ??
                  TranslationConstants.LANGUAGES,
              children: LanguageConstants.languages
                  .map(
                    (language) => CustomNavigationDrawerSublistItem(
                        title: language.value,
                        onPressed: () {
                          (int index) {
                            BlocProvider.of<LanguageBloc>(context).add(
                                ToogleLanguageEvent(
                                    language:
                                        LanguageConstants.languages[index]));
                          };
                        }),
                  )
                  .toList(),
              onPressed: (int index) {
                BlocProvider.of<LanguageBloc>(context).add(ToogleLanguageEvent(
                    language: LanguageConstants.languages[index]));
              },
            ),
            CustomNavigationDrawerListItem(
              title: TranslationConstants.FEEDBACK.translate(context) ??
                  TranslationConstants.FEEDBACK,
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            CustomNavigationDrawerListItem(
              title: TranslationConstants.ABOUT.translate(context) ??
                  TranslationConstants.ABOUT,
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: TranslationConstants.ABOUT,
          description: TranslationConstants.ABOUT_DESCRIPTION,
          buttonText: TranslationConstants.OKAY,
          child: Image.asset(
            'assets/images/pngs/tmdb_logo.png',
            height: Sizes.dimen_40,
          ),
        );
      },
    );
  }
}
