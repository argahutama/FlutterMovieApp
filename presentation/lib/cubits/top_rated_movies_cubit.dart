import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_top_rated_tv_series.dart';

part 'top_rated_movies_cubit.freezed.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedMoviesCubit(
    this.getTopRatedTvSeries,
  ) : super(TopRatedMoviesState.initial());

  void fetchTopRatedMovies() async {
    emit(state.copyWith(moviesState: RequestState.loading));
    final result = await getTopRatedTvSeries.execute();
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
