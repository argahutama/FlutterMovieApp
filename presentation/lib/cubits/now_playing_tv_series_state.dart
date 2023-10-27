part of 'now_playing_tv_series_cubit.dart';

@freezed
abstract class NowPlayingTvSeriesState with _$NowPlayingTvSeriesState {
  const factory NowPlayingTvSeriesState({
    required List<Movie> movies,
    required RequestState moviesState,
    required String message,
  }) = _NowPlayingTvSeriesState;

  factory NowPlayingTvSeriesState.initial() => const NowPlayingTvSeriesState(
        movies: [],
        moviesState: RequestState.empty,
        message: '',
      );
}
