part of 'movie_search_cubit.dart';

@freezed
abstract class MovieSearchState with _$MovieSearchState {
  const factory MovieSearchState({
    required List<Movie> movies,
    required RequestState moviesState,
    required String message,
  }) = _MovieSearchState;

  factory MovieSearchState.initial() => const MovieSearchState(
    movies: [],
    moviesState: RequestState.empty,
    message: '',
  );
}
