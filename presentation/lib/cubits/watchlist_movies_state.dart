part of 'watchlist_movies_cubit.dart';

@freezed
class WatchlistMovieState with _$WatchlistMovieState {
  const factory WatchlistMovieState({
    required List<Movie> watchList,
    required RequestState watchListState,
    required String message,
  }) = _WatchlistMovieState;

  factory WatchlistMovieState.initial() => const WatchlistMovieState(
        watchList: [],
        watchListState: RequestState.empty,
        message: '',
      );
}
