part of 'movie_list_cubit.dart';

@freezed
abstract class MovieListState with _$MovieListState {
  const factory MovieListState({
    required List<Movie> nowPlayingMovies,
    required RequestState nowPlayingState,
    required List<Movie> popularMovies,
    required RequestState popularMoviesState,
    required List<Movie> topRatedMovies,
    required RequestState topRatedMoviesState,
    required String message,
  }) = _MovieListState;

  factory MovieListState.initial() => const MovieListState(
    nowPlayingMovies: [],
    nowPlayingState: RequestState.empty,
    popularMovies: [],
    popularMoviesState: RequestState.empty,
    topRatedMovies: [],
    topRatedMoviesState: RequestState.empty,
    message: '',
  );
}
