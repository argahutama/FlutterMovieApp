import 'package:common/common.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
