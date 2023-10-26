part of 'movie_detail_cubit.dart';

@freezed
abstract class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    required MovieDetail? movie,
    required RequestState movieState,
    required List<Movie> movieRecommendations,
    required RequestState recommendationState,
    required String message,
    required bool isAddedToWatchlist,
    required String watchlistMessage,
  }) = _MovieDetailState;

  factory MovieDetailState.empty() => const MovieDetailState(
    movie: null,
    movieState: RequestState.empty,
    movieRecommendations: [],
    recommendationState: RequestState.empty,
    message: '',
    isAddedToWatchlist: false,
    watchlistMessage: '',
  );
}
