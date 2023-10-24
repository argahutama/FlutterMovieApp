import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/about_page.dart';
import 'package:presentation/pages/home_movie_page.dart';
import 'package:presentation/pages/home_tv_series_page.dart';
import 'package:presentation/pages/movie_detail_page.dart';
import 'package:presentation/pages/popular_movies_page.dart';
import 'package:presentation/pages/search_page.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';
import 'package:presentation/pages/watchlist_movies_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeMoviePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeMoviePage(),
      );
    case HomeTvSeriesPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeTvSeriesPage(),
      );
    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => const PopularMoviesPage(),
      );
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => const TopRatedMoviesPage(),
      );
    case MovieDetailPage.routeName:
      final args = settings.arguments as Map<String, dynamic>?;

      final id = args?['id'] ?? 0;
      final isMovie = args?['isMovie'] ?? true;

      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(
          id: id,
          isMovie: isMovie,
        ),
        settings: settings,
      );
    case SearchPage.routeName:
      return CupertinoPageRoute(builder: (_) => const SearchPage());
    case WatchlistMoviesPage.routeName:
      return MaterialPageRoute(builder: (_) => const WatchlistMoviesPage());
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
