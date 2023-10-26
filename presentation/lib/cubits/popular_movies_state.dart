part of 'popular_movies_cubit.dart';

@freezed
abstract class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState({
    required List<Movie> movies,
    required RequestState moviesState,
    required String message,
  }) = _PopularMoviesState;

  factory PopularMoviesState.initial() => const PopularMoviesState(
        movies: [],
        moviesState: RequestState.empty,
        message: '',
      );
}
