import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:movie_app/src/features/features.dart';

import '../../common/common.dart';

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

  locator.registerFactory<SearchMovieBloc>(
    () => SearchMovieBloc(
      searchMovie: locator(),
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

  locator.registerLazySingleton<SearchMovie>(() => SearchMovie(locator()));
  //! Repositories
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<MovieDetailRepository>(
      () => MovieDetailRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<SearchMovieRepository>(
      () => SearchMovieRepositoryImpl(remoteDataSource: locator()));

  //! Remote Data Sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<MovieDetailRemoteDataSource>(
      () => MovieDetailRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<SearchMovieRemoteDataSource>(
      () => SearchMovieRemoteDataSourceImpl(locator()));
  //! Core
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));
  //! External Packages
  locator.registerLazySingleton<Client>(() => Client());
}
