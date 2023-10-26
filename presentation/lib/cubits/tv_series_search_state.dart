part of 'tv_series_search_cubit.dart';

@freezed
abstract class TvSeriesSearchState with _$TvSeriesSearchState {
  const factory TvSeriesSearchState({
    required List<Movie> tvSeries,
    required RequestState tvSeriesState,
    required String message,
  }) = _MovieSearchState;

  factory TvSeriesSearchState.initial() => const TvSeriesSearchState(
    tvSeries: [],
    tvSeriesState: RequestState.empty,
    message: '',
  );
}
