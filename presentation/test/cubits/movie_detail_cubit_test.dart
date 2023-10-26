import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/remove_watchlist.dart';
import 'package:domain/usecases/save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubits/movie_detail_cubit.dart';

import '../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailCubit cubit;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    cubit = MovieDetailCubit(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;

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
    isMovie: true,
  );
  final tMovies = <Movie>[tMovie];

  void arrangeUsecase() {
    when(mockGetMovieDetail.execute(tId, true))
        .thenAnswer((_) async => Right(testMovieDetail));
    when(mockGetMovieRecommendations.execute(tId, true))
        .thenAnswer((_) async => Right(tMovies));
  }

  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      verify(mockGetMovieDetail.execute(tId, true));
      verify(mockGetMovieRecommendations.execute(tId, true));
    });

    test('should change state to Loading when usecase is called', () async {
      // arrange
      arrangeUsecase();
      // act
      cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.movieState, RequestState.loading);
    });

    test('should change movie when data is gotten successfully', () async {
      // arrange
      arrangeUsecase();
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.movieState, RequestState.loaded);
      expect(cubit.state.movie, testMovieDetail);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.movieState, RequestState.loaded);
      expect(cubit.state.movieRecommendations, tMovies);
    });
  });

  group('Get Movie Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      verify(mockGetMovieRecommendations.execute(tId, true));
      expect(cubit.state.movieRecommendations, tMovies);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.recommendationState, RequestState.loaded);
      expect(cubit.state.movieRecommendations, tMovies);
    });

    test(
        'should ignore error message when '
        'recommendation request is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(tId, true))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(tId, true))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.movieState, RequestState.loaded);
      expect(cubit.state.recommendationState, RequestState.empty);
      expect(cubit.state.message, '');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchlistStatus.execute(1)).thenAnswer((_) async => true);
      // act
      await cubit.loadWatchlistStatus(1);
      // assert
      expect(cubit.state.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await cubit.addWatchlist(testMovieDetail);
      // assert
      verify(mockSaveWatchlist.execute(testMovieDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await cubit.removeFromWatchlist(testMovieDetail);
      // assert
      verify(mockRemoveWatchlist.execute(testMovieDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await cubit.addWatchlist(testMovieDetail);
      // assert
      verify(mockGetWatchlistStatus.execute(testMovieDetail.id));
      expect(cubit.state.watchlistMessage, 'Added to Watchlist');
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(mockGetWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await cubit.addWatchlist(testMovieDetail);
      // assert
      expect(cubit.state.watchlistMessage, 'Failed');
    });
  });

  group('on Error', () {
    test('should return empty when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(tId, true))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(tId, true))
          .thenAnswer((_) async => Right(tMovies));
      // act
      await cubit.fetchMovieDetail(tId, true);
      // assert
      expect(cubit.state.movieState, RequestState.error);
      expect(cubit.state.recommendationState, RequestState.empty);
      expect(cubit.state.message, 'Server Failure');
    });
  });
}
