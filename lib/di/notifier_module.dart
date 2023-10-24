import 'package:common/common.dart';
import 'package:presentation/provider/movie_detail_notifier.dart';
import 'package:presentation/provider/movie_list_notifier.dart';
import 'package:presentation/provider/movie_search_notifier.dart';
import 'package:presentation/provider/popular_movies_notifier.dart';
import 'package:presentation/provider/top_rated_movies_notifier.dart';
import 'package:presentation/provider/watchlist_movie_notifier.dart';

@module
abstract class NotifierModule {
  @injectable
  MovieListNotifier get movieListNotifier;

  @injectable
  MovieDetailNotifier get movieDetailNotifier;

  @injectable
  MovieSearchNotifier get movieSearchNotifier;

  @injectable
  PopularMoviesNotifier get popularMoviesNotifier;

  @injectable
  TopRatedMoviesNotifier get topRatedMoviesNotifier;

  @injectable
  WatchlistMovieNotifier get watchlistMovieNotifier;
}
