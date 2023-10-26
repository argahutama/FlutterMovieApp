import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_watchlist_movies.dart';

part 'watchlist_movies_cubit.freezed.dart';

part 'watchlist_movies_state.dart';

class WatchlistMoviesCubit extends Cubit<WatchlistMovieState> {
  final GetWatchlistMovies getWatchlistMovies;

  WatchlistMoviesCubit(this.getWatchlistMovies) : super(WatchlistMovieState.initial());

  Future<void> fetchWatchlistMovies() async {
    emit(state.copyWith(watchListState: RequestState.loading));

    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) => emit(state.copyWith(
        watchListState: RequestState.error,
        message: failure.message,
      )),
      (moviesData) => emit(state.copyWith(
        watchListState: RequestState.loaded,
        watchList: moviesData,
      )),
    );
  }
}
