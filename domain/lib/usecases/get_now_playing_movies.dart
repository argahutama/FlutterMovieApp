import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
