import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';

part 'now_playing_movies_cubit.freezed.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesCubit(
    this.getNowPlayingMovies,
  ) : super(NowPlayingMoviesState.initial());

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(moviesState: RequestState.loading));
    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          moviesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          moviesState: RequestState.loaded,
          movies: moviesData,
        ));
      },
    );
  }
}
