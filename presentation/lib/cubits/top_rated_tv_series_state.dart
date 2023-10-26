part of 'top_rated_tv_series_cubit.dart';

@freezed
abstract class TopRatedTvSeriesState with _$TopRatedTvSeriesState {
  const factory TopRatedTvSeriesState({
    required List<Movie> tvSeries,
    required RequestState tvSeriesState,
    required String message,
  }) = _TopRatedTvSeriesState;

  factory TopRatedTvSeriesState.initial() => const TopRatedTvSeriesState(
        tvSeries: [],
        tvSeriesState: RequestState.empty,
        message: '',
      );
}
