import 'package:common/common.dart';
import 'package:presentation/cubits/movie_detail_cubit.dart';
import 'package:presentation/cubits/movie_list_cubit.dart';
import 'package:presentation/cubits/movie_search_cubit.dart';
import 'package:presentation/cubits/popular_movies_cubit.dart';
import 'package:presentation/cubits/popular_tv_series_cubit.dart';
import 'package:presentation/cubits/top_rated_movies_cubit.dart';
import 'package:presentation/cubits/top_rated_tv_series_cubit.dart';
import 'package:presentation/cubits/tv_series_list_cubit.dart';
import 'package:presentation/cubits/tv_series_search_cubit.dart';
import 'package:presentation/cubits/watchlist_movies_cubit.dart';

@module
abstract class PresentationModule {
  @injectable
  MovieListCubit get movieListCubit;

  @injectable
  TvSeriesListCubit get tvSeriesListCubit;

  @injectable
  MovieDetailCubit get movieDetailCubit;

  @injectable
  MovieSearchCubit get movieSearchCubit;

  @injectable
  TvSeriesSearchCubit get tvSeriesSearchCubit;

  @injectable
  PopularMoviesCubit get popularMoviesCubit;

  @injectable
  PopularTvSeriesCubit get popularTvSeriesCubit;

  @injectable
  TopRatedMoviesCubit get topRatedMoviesCubit;

  @injectable
  TopRatedTvSeriesCubit get topRatedTvSeriesCubit;

  @injectable
  WatchlistMoviesCubit get watchlistMoviesCubit;
}
