part of 'popular_tv_series_cubit.dart';

@freezed
abstract class PopularTvSeriesState with _$PopularTvSeriesState {
  const factory PopularTvSeriesState({
    required List<Movie> tvSeries,
    required RequestState tvSeriesState,
    required String message,
  }) = _PopularTvSeriesState;

  factory PopularTvSeriesState.initial() => const PopularTvSeriesState(
        tvSeries: [],
        tvSeriesState: RequestState.empty,
        message: '',
      );
}
