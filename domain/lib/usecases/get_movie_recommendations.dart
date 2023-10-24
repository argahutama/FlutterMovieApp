import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
