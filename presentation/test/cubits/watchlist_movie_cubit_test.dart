import 'package:common/common.dart';
import 'package:common/failure.dart';
import 'package:common/state_enum.dart';
import 'package:domain/usecases/get_watchlist_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubits/watchlist_movies_cubit.dart';

import '../dummy_data/dummy_objects.dart';
import 'watchlist_movie_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistMoviesCubit cubit;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    cubit = WatchlistMoviesCubit(mockGetWatchlistMovies);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => Right([testWatchlistMovie]));
    // act
    await cubit.fetchWatchlistMovies();
    // assert
    expect(cubit.state.watchListState, RequestState.loaded);
    expect(cubit.state.watchList, [testWatchlistMovie]);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => const Left(DatabaseFailure("Can't get data")));
    // act
    await cubit.fetchWatchlistMovies();
    // assert
    expect(cubit.state.watchListState, RequestState.error);
    expect(cubit.state.message, "Can't get data");
  });
}
