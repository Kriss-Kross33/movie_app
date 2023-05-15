import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/presentation/widgets/custom_navigation_drawer/custom_navigation_drawer_sublist_item.dart';

class NavigationDrawerExpandedListTile extends StatelessWidget {
  final String title;
  final Function(int index) onPressed;
  final List<CustomNavigationDrawerSublistItem> children;

  const NavigationDrawerExpandedListTile({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          for (int i = 0; i < this.children.length; i++)
            CustomNavigationDrawerSublistItem(
                title: children[i].title, onPressed: () => onPressed(i)),
        ],
      ),
    );
  }
}
