import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetPopularTvSeries {
  final MovieRepository repository;

  GetPopularTvSeries(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularTvSeries();
  }
}
