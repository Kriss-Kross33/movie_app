import 'package:flutter/material.dart';
import 'package:movie_app/src/common/widgets/widgets.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final FailureType failureType;
  final VoidCallback? onPressed;

  const AppErrorWidget({
    Key? key,
    required this.failureType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_30.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            failureType == FailureType.api
                ? TranslationConstants.SOMETHING_WENT_WRONG.translate(context)!
                : TranslationConstants.CHECK_NETWORK.translate(context)!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ButtonBar(
            children: <Widget>[
              Button(
                onPressed: onPressed,
                text: TranslationConstants.RETRY,
              ),
              Button(
                onPressed: () => Wiredash.of(context).show(),
                text: TranslationConstants.FEEDBACK,
              ),
            ],
          )
        ],
      ),
    );
  }
}
