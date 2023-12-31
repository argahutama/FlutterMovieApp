import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late GetMovieRecommendations usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovieRecommendations(mockMovieRepository);
  });

  const tId = 1;
  final tMovies = <Movie>[];

  test('should get list of movie recommendations from the repository',
      () async {
    // arrange
    when(mockMovieRepository.getMovieRecommendations(tId, true))
        .thenAnswer((_) async => Right(tMovies));
    // act
    final result = await usecase.execute(tId, true);
    // assert
    expect(result, Right(tMovies));
  });
}
