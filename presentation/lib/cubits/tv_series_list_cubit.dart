import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_now_playing_tv_series.dart';
import 'package:domain/usecases/get_popular_tv_series.dart';
import 'package:domain/usecases/get_top_rated_tv_series.dart';

part 'tv_series_list_cubit.freezed.dart';

part 'tv_series_list_state.dart';

class TvSeriesListCubit extends Cubit<TvSeriesListState> {
  TvSeriesListCubit({
    required this.getNowPlayingTvSeries,
    required this.getPopularTvSeries,
    required this.getTopRatedTvSeries,
  }) : super(TvSeriesListState.initial());

  final GetNowPlayingTvSeries getNowPlayingTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  void fetchNowPlayingTvSeries() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingTvSeries.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          message: failure.message,
        ));
      },
      (tvSeriesData) {
        emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingTvSeries: tvSeriesData,
        ));
      },
    );
  }

  void fetchPopularTvSeries() async {
    emit(state.copyWith(popularTvSeriesState: RequestState.loading));
    final result = await getPopularTvSeries.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          popularTvSeriesState: RequestState.error,
          message: failure.message,
        ));
      },
      (tvSeriesData) {
        emit(state.copyWith(
          popularTvSeriesState: RequestState.loaded,
          popularTvSeries: tvSeriesData,
        ));
      },
    );
  }

  void fetchTopRatedTvSeries() async {
    emit(state.copyWith(topRatedTvSeriesState: RequestState.loading));
    final result = await getTopRatedTvSeries.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          topRatedTvSeriesState: RequestState.error,
          message: failure.message,
        ));
      },
      (tvSeriesData) {
        emit(state.copyWith(
          topRatedTvSeriesState: RequestState.loaded,
          topRatedTvSeries: tvSeriesData,
        ));
      },
    );
  }
}
