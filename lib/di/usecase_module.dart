import 'package:common/common.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_now_playing_tv_series.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_popular_tv_series.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:domain/usecases/get_top_rated_tv_series.dart';
import 'package:domain/usecases/get_watchlist_movies.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/remove_watchlist.dart';
import 'package:domain/usecases/save_watchlist.dart';
import 'package:domain/usecases/search_movies.dart';
import 'package:domain/usecases/search_tv_series.dart';

@module
abstract class UseCaseModule {
  @lazySingleton
  GetNowPlayingMovies get getNowPlayingMovies;

  @lazySingleton
  GetNowPlayingTvSeries get getNowPlayingTvSeries;

  @lazySingleton
  GetPopularMovies get getPopularMovies;

  @lazySingleton
  GetPopularTvSeries get getPopularTvSeries;

  @lazySingleton
  GetTopRatedMovies get getTopRatedMovies;

  @lazySingleton
  GetTopRatedTvSeries get getTopRatedTvSeries;

  @lazySingleton
  GetMovieDetail get getMovieDetail;

  @lazySingleton
  GetMovieRecommendations get getMovieRecommendations;

  @lazySingleton
  SearchMovies get searchMovies;

  @lazySingleton
  SearchTvSeries get searchTvSeries;

  @lazySingleton
  GetWatchListStatus get getWatchListStatus;

  @lazySingleton
  SaveWatchlist get saveWatchlist;

  @lazySingleton
  RemoveWatchlist get removeWatchlist;

  @lazySingleton
  GetWatchlistMovies get getWatchlistMovies;
}
