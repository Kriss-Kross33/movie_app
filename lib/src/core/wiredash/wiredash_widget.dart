import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';
import 'package:wiredash/wiredash.dart';

class WiredashWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashWidget({
    Key? key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: navigatorKey,
      child: child,
      projectId: ApiConstants.WIRE_DASH_PROJECT_ID,
      secret: ApiConstants.WIRE_DASH_SECRET,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(languageCode: languageCode),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,

        //dividerColor: AppColor.vulcan,
      ),
    );
  }
}
