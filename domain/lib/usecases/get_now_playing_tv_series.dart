import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:common/failure.dart';

class GetNowPlayingTvSeries {
  final MovieRepository repository;

  GetNowPlayingTvSeries(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingTvSeries();
  }
}
