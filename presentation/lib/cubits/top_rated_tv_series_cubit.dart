import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';

part 'top_rated_tv_series_cubit.freezed.dart';

part 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedTvSeriesCubit(
    this.getTopRatedMovies,
  ) : super(TopRatedTvSeriesState.initial());

  void fetchTopRatedTvSeries() async {
    emit(state.copyWith(tvSeriesState: RequestState.loading));
    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          tvSeriesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          tvSeriesState: RequestState.loaded,
          tvSeries: moviesData,
        ));
      },
    );
  }
}
