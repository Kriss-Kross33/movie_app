import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackArrow(),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_20.h,
        ),
      ],
    );
  }
}
