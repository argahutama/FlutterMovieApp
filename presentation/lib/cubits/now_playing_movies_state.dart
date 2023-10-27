part of 'now_playing_movies_cubit.dart';

@freezed
abstract class NowPlayingMoviesState with _$NowPlayingMoviesState {
  const factory NowPlayingMoviesState({
    required List<Movie> movies,
    required RequestState moviesState,
    required String message,
  }) = _NowPlayingMoviesState;

  factory NowPlayingMoviesState.initial() => const NowPlayingMoviesState(
        movies: [],
        moviesState: RequestState.empty,
        message: '',
      );
}
