import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_top_rated_tv_series.dart';

part 'top_rated_tv_series_cubit.freezed.dart';

part 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesCubit(
    this.getTopRatedTvSeries,
  ) : super(TopRatedTvSeriesState.initial());

  Future<void> fetchTopRatedTvSeries() async {
    emit(state.copyWith(tvSeriesState: RequestState.loading));
    final result = await getTopRatedTvSeries.execute();
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
