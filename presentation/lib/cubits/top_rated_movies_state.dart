part of 'top_rated_movies_cubit.dart';

@freezed
abstract class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState({
    required List<Movie> movies,
    required RequestState moviesState,
    required String message,
  }) = _TopRatedMoviesState;

  factory TopRatedMoviesState.initial() => const TopRatedMoviesState(
    movies: [],
    moviesState: RequestState.empty,
    message: '',
  );
}

