import 'package:common/common.dart';
import 'package:common/di/injection.dart';
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

final providers = <ChangeNotifierProvider>[
  ChangeNotifierProvider(
    create: (_) => getIt<MovieListNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<TvSeriesListNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<MovieDetailNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<MovieSearchNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<TvSeriesSearchNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<TopRatedMoviesNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<TopRatedTvSeriesNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<PopularMoviesNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<PopularTvSeriesNotifier>(),
  ),
  ChangeNotifierProvider(
    create: (_) => getIt<WatchlistMovieNotifier>(),
  ),
];
