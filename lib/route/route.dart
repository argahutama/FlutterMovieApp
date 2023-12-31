import 'package:common/common.dart';
import 'package:common/di/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/route/home_page.dart';
import 'package:presentation/cubits/movie_detail_cubit.dart';
import 'package:presentation/cubits/movie_search_cubit.dart';
import 'package:presentation/cubits/now_playing_movies_cubit.dart';
import 'package:presentation/cubits/now_playing_tv_series_cubit.dart';
import 'package:presentation/cubits/popular_movies_cubit.dart';
import 'package:presentation/cubits/popular_tv_series_cubit.dart';
import 'package:presentation/cubits/top_rated_movies_cubit.dart';
import 'package:presentation/cubits/top_rated_tv_series_cubit.dart';
import 'package:presentation/cubits/tv_series_list_cubit.dart';
import 'package:presentation/cubits/tv_series_search_cubit.dart';
import 'package:presentation/cubits/watchlist_movies_cubit.dart';
import 'package:presentation/pages/about_page.dart';
import 'package:presentation/pages/home_movie_page.dart';
import 'package:presentation/pages/home_tv_series_page.dart';
import 'package:presentation/pages/movie_detail_page.dart';
import 'package:presentation/pages/now_playing_movies_page.dart';
import 'package:presentation/pages/now_playing_tv_series_page.dart';
import 'package:presentation/pages/popular_movies_page.dart';
import 'package:presentation/pages/popular_tv_series_page.dart';
import 'package:presentation/pages/search_movies_page.dart';
import 'package:presentation/pages/search_tv_series_page.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';
import 'package:presentation/pages/top_rated_tv_series_page.dart';
import 'package:presentation/pages/watchlist_movies_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeMoviePage.routeName:
      return MaterialPageRoute(
        builder: (_) => homePage,
      );
    case HomeTvSeriesPage.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<TvSeriesListCubit>()
            ..fetchNowPlayingTvSeries()
            ..fetchPopularTvSeries()
            ..fetchTopRatedTvSeries(),
          child: const HomeTvSeriesPage(),
        ),
      );
    case NowPlayingMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<NowPlayingMoviesCubit>()..fetchNowPlayingMovies(),
          child: const NowPlayingMoviesPage(),
        ),
      );
    case NowPlayingTvSeriesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<NowPlayingTvSeriesCubit>()..fetchNowPlayingTvSeries(),
          child: const NowPlayingTvSeriesPage(),
        ),
      );
    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<PopularMoviesCubit>()..fetchPopularMovies(),
          child: const PopularMoviesPage(),
        ),
      );
    case PopularTvSeriesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<PopularTvSeriesCubit>()..fetchPopularMovies(),
          child: const PopularTvSeriesPage(),
        ),
      );
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<TopRatedMoviesCubit>()..fetchTopRatedMovies(),
          child: const TopRatedMoviesPage(),
        ),
      );
    case TopRatedTvSeriesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<TopRatedTvSeriesCubit>()..fetchTopRatedTvSeries(),
          child: const TopRatedTvSeriesPage(),
        ),
      );
    case MovieDetailPage.routeName:
      final args = settings.arguments as Map<String, dynamic>?;

      final id = args?['id'] ?? 0;
      final isMovie = args?['isMovie'] ?? true;

      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<MovieDetailCubit>()
            ..fetchMovieDetail(id, isMovie)
            ..loadWatchlistStatus(id),
          child: MovieDetailPage(isMovie: isMovie),
        ),
        settings: settings,
      );
    case SearchMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<MovieSearchCubit>(),
          child: const SearchMoviesPage(),
        ),
      );
    case SearchTvSeriesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<TvSeriesSearchCubit>(),
          child: const SearchTvSeriesPage(),
        ),
      );
    case WatchlistMoviesPage.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              getIt<WatchlistMoviesCubit>()..fetchWatchlistMovies(),
          child: const WatchlistMoviesPage(),
        ),
      );
    case AboutPage.routeName:
      return MaterialPageRoute(builder: (_) => const AboutPage());
    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
