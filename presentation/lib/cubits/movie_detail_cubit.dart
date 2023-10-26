import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/remove_watchlist.dart';
import 'package:domain/usecases/save_watchlist.dart';

part 'movie_detail_cubit.freezed.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(MovieDetailState.empty());

  Future<void> fetchMovieDetail(int id, bool isMovie) async {
    emit(state.copyWith(movieState: RequestState.loading));

    final detailResult = await getMovieDetail.execute(id, isMovie);
    final recommendationResult =
        await getMovieRecommendations.execute(id, isMovie);

    detailResult.fold(
      (failure) {
        emit(state.copyWith(
          movieState: RequestState.error,
          message: failure.message,
        ));
      },
      (movie) {
        final List<Movie> movieRecommendations = recommendationResult.fold(
          (failure) => [],
          (movies) => movies,
        );

        emit(state.copyWith(
          movieState: RequestState.loaded,
          movie: movie,
          recommendationState: movieRecommendations.isNotEmpty
              ? RequestState.loaded
              : RequestState.empty,
          movieRecommendations: movieRecommendations,
        ));
      },
    );
  }

  Future<void> addWatchlist(MovieDetail? movie) async {
    if (movie == null) {
      return;
    }

    final result = await saveWatchlist.execute(movie);

    final watchlistMessage = result.fold(
      (failure) => failure.message,
      (successMessage) => successMessage,
    );

    emit(state.copyWith(watchlistMessage: watchlistMessage));
    loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(MovieDetail? movie) async {
    if (movie == null) {
      return;
    }

    final result = await removeWatchlist.execute(movie);

    final watchlistMessage = result.fold(
      (failure) => failure.message,
      (successMessage) => successMessage,
    );

    emit(state.copyWith(watchlistMessage: watchlistMessage));
    loadWatchlistStatus(movie.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    emit(state.copyWith(isAddedToWatchlist: result));
  }

  void resetMessage() {
    emit(state.copyWith(
      message: '',
      watchlistMessage: '',
    ));
  }
}
