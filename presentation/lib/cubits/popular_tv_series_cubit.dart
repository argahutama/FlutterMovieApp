import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_popular_tv_series.dart';

part 'popular_tv_series_cubit.freezed.dart';

part 'popular_tv_series_state.dart';

class PopularTvSeriesCubit extends Cubit<PopularTvSeriesState> {
  final GetPopularTvSeries getPopularTvSeries;

  PopularTvSeriesCubit(
    this.getPopularTvSeries,
  ) : super(PopularTvSeriesState.initial());

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(tvSeriesState: RequestState.loading));
    final result = await getPopularTvSeries.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          tvSeriesState: RequestState.error,
          message: failure.message,
        ));
      },
      (tvSeriesData) {
        emit(state.copyWith(
          tvSeriesState: RequestState.loaded,
          tvSeries: tvSeriesData,
        ));
      },
    );
  }
}
