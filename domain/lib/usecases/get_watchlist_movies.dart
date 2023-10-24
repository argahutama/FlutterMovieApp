import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
