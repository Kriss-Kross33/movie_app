import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/core/api_client/api_client.dart';
import 'package:movie_app/src/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/src/features/home/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/src/features/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_now_playing.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_popular.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_trending.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import 'package:movie_app/src/features/languages/presentation/bloc/language_bloc/language_bloc.dart';

final locator = GetIt.I;

Future setUpLocator() async {
  //! Bloc
  locator.registerFactory<MovieCarouselBloc>(() =>
      MovieCarouselBloc(getTrending: locator(), movieBackdropBloc: locator()));
  locator.registerFactory<MovieBackdropBloc>(() => MovieBackdropBloc());
  locator.registerFactory<MovieTabbedBloc>(
    () => MovieTabbedBloc(
      getPopular: locator(),
      getComingSoon: locator(),
      getPlayingNow: locator(),
    ),
  );
  locator.registerSingleton<LanguageBloc>(LanguageBloc());
  //! Usecases
  locator.registerLazySingleton<GetTrending>(() => GetTrending(locator()));
  locator.registerLazySingleton<GetPopular>(() => GetPopular(locator()));
  locator.registerLazySingleton<GetComingSoon>(() => GetComingSoon(locator()));
  locator.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(locator()));
  //! Repositories
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: locator()));
  //! Remote Data Sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(locator()));
  //! Core
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));
  //! External Packages
  locator.registerLazySingleton<Client>(() => Client());
}
