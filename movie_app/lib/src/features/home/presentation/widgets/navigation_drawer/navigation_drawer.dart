import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/features/home/presentation/widgets/logo_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/navigation_drawer/navigation_drawer_expanded_list_tile.dart';
import 'package:movie_app/src/features/home/presentation/widgets/navigation_drawer/navigation_drawer_list_item.dart';
import 'package:movie_app/src/features/home/presentation/widgets/navigation_drawer/navigation_drawer_sublist_item.dart';
import '../../../../../core/extensions/size_extension.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

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
            NavigationDrawerListItem(
              title: 'Favourite Movies',
              onPressed: () {},
            ),
            NavigationDrawerExpandedListTile(
              title: 'Languages',
              children: [
                NavigationDrawerSublistItem(
                  title: 'English',
                  onPressed: () {},
                ),
                NavigationDrawerSublistItem(
                  title: 'French',
                  onPressed: () {},
                ),
                NavigationDrawerSublistItem(
                  title: 'Spanish',
                  onPressed: () {},
                ),
              ],
              onPressed: () {},
            ),
            NavigationDrawerListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationDrawerListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
