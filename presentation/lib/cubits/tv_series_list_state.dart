part of 'tv_series_list_cubit.dart';

@freezed
abstract class TvSeriesListState with _$TvSeriesListState {
  const factory TvSeriesListState({
    required List<Movie> nowPlayingTvSeries,
    required RequestState nowPlayingState,
    required List<Movie> popularTvSeries,
    required RequestState popularTvSeriesState,
    required List<Movie> topRatedTvSeries,
    required RequestState topRatedTvSeriesState,
    required String message,
  }) = _TvSeriesListState;

  factory TvSeriesListState.initial() => const TvSeriesListState(
    nowPlayingTvSeries: [],
    nowPlayingState: RequestState.empty,
    popularTvSeries: [],
    popularTvSeriesState: RequestState.empty,
    topRatedTvSeries: [],
    topRatedTvSeriesState: RequestState.empty,
    message: '',
  );
}
