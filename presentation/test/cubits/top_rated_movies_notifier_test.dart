import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubits/top_rated_movies_cubit.dart';

import 'movie_list_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesCubit cubit;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    cubit = TopRatedMoviesCubit(mockGetTopRatedMovies);
  });

  final tMovie = Movie(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: const [1, 2, 3],
      id: 1,
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
      isMovie: true);

  final tMovieList = <Movie>[tMovie];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => Right(tMovieList));
    // act
    cubit.fetchTopRatedMovies();
    // assert
    expect(cubit.state.moviesState, RequestState.loading);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => Right(tMovieList));
    // act
    await cubit.fetchTopRatedMovies();
    // assert
    expect(cubit.state.moviesState, RequestState.loaded);
    expect(cubit.state.movies, tMovieList);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await cubit.fetchTopRatedMovies();
    // assert
    expect(cubit.state.moviesState, RequestState.error);
    expect(cubit.state.message, 'Server Failure');
  });
}
