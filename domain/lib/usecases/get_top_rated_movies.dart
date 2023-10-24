import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
