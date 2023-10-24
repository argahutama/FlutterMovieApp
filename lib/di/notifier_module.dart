import 'package:common/common.dart';
import 'package:presentation/provider/movie_detail_notifier.dart';
import 'package:presentation/provider/movie_list_notifier.dart';
import 'package:presentation/provider/movie_search_notifier.dart';
import 'package:presentation/provider/popular_movies_notifier.dart';
import 'package:presentation/provider/popular_tv_series_notifier.dart';
import 'package:presentation/provider/top_rated_movies_notifier.dart';
import 'package:presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:presentation/provider/tv_series_list_notifier.dart';
import 'package:presentation/provider/tv_series_search_notifier.dart';
import 'package:presentation/provider/watchlist_movie_notifier.dart';

@module
abstract class NotifierModule {
  @injectable
  MovieListNotifier get movieListNotifier;

  @injectable
  TvSeriesListNotifier get tvSeriesListNotifier;

  @injectable
  MovieDetailNotifier get movieDetailNotifier;

  @injectable
  MovieSearchNotifier get movieSearchNotifier;

  @injectable
  TvSeriesSearchNotifier get tvSeriesSearchNotifier;

  @injectable
  PopularMoviesNotifier get popularMoviesNotifier;

  @injectable
  PopularTvSeriesNotifier get popularTvSeriesNotifier;

  @injectable
  TopRatedMoviesNotifier get topRatedMoviesNotifier;

  @injectable
  TopRatedTvSeriesNotifier get topRatedTvSeriesNotifier;

  @injectable
  WatchlistMovieNotifier get watchlistMovieNotifier;
}
