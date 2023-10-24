import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:common/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingTvSeries();
  Future<Either<Failure, List<Movie>>> getPopularTvSeries();
  Future<Either<Failure, List<Movie>>> getTopRatedTvSeries();
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id, bool isMovie);
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id, bool isMovie);
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> searchTvSeries(String query);
  Future<Either<Failure, String>> saveWatchlist(MovieDetail movie);
  Future<Either<Failure, String>> removeWatchlist(MovieDetail movie);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<Movie>>> getWatchlistMovies();
}
