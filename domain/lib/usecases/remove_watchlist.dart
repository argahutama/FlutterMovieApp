import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/repositories/movie_repository.dart';

class RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
