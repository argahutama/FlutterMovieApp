import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';

class SearchTvSeries {
  final MovieRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
