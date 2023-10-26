import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';

part 'movie_list_cubit.freezed.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
  }) : super(MovieListState.initial());

  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  void fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: moviesData,
        ));
      },
    );
  }

  void fetchPopularMovies() async {
    emit(state.copyWith(popularMoviesState: RequestState.loading));
    final result = await getPopularMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          popularMoviesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          popularMoviesState: RequestState.loaded,
          popularMovies: moviesData,
        ));
      },
    );
  }

  void fetchTopRatedMovies() async {
    emit(state.copyWith(topRatedMoviesState: RequestState.loading));
    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.loaded,
          topRatedMovies: moviesData,
        ));
      },
    );
  }
}
