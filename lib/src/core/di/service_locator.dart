import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/core/api_client/api_client.dart';
import 'package:movie_app/src/features/features.dart';

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
  locator.registerFactory<MovieDetailBloc>(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
      movieCastBloc: locator(),
      movieVideoBloc: locator(),
    ),
  );

  locator.registerFactory<MovieCastBloc>(
    () => MovieCastBloc(
      getMovieCast: locator(),
    ),
  );

  locator.registerFactory<MovieVideoBloc>(
    () => MovieVideoBloc(
      getMovieVideos: locator(),
    ),
  );
  locator.registerSingleton<LanguageBloc>(LanguageBloc());
  //! Usecases
  locator.registerLazySingleton<GetTrending>(() => GetTrending(locator()));
  locator.registerLazySingleton<GetPopular>(() => GetPopular(locator()));
  locator.registerLazySingleton<GetComingSoon>(() => GetComingSoon(locator()));
  locator.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(locator()));
  locator
      .registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(locator()));

  locator.registerLazySingleton<GetMovieCast>(() => GetMovieCast(locator()));

  locator
      .registerLazySingleton<GetMovieVideos>(() => GetMovieVideos(locator()));
  //! Repositories
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<MovieDetailRepository>(
      () => MovieDetailRepositoryImpl(remoteDataSource: locator()));

  //! Remote Data Sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<MovieDetailRemoteDataSource>(
      () => MovieDetailRemoteDataSourceImpl(locator()));
  //! Core
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));
  //! External Packages
  locator.registerLazySingleton<Client>(() => Client());
}
