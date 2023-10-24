import 'package:common/common.dart';
import 'package:data/repositories/movie_repository_impl.dart';
import 'package:domain/repositories/movie_repository.dart';

@module
abstract class RepositoryModule {
  @LazySingleton(as: MovieRepository)
  MovieRepositoryImpl get movieRepository;
}