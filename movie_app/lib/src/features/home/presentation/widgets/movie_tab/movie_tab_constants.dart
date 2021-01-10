import 'package:movie_app/src/core/constants/translation_constants.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_tab/tab.dart';

class MovieTabConstants {
  static const List<Tab> movieTabs = const <Tab>[
    const Tab(index: 0, title: TranslationConstants.POPULAR),
    const Tab(index: 1, title: TranslationConstants.NOW),
    const Tab(index: 2, title: TranslationConstants.SOON),
  ];
}
