import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_now_playing_tv_series.dart';

part 'now_playing_tv_series_cubit.freezed.dart';

part 'now_playing_tv_series_state.dart';

class NowPlayingTvSeriesCubit extends Cubit<NowPlayingTvSeriesState> {
  final GetNowPlayingTvSeries getNowPlayingTvSeries;

  NowPlayingTvSeriesCubit(
    this.getNowPlayingTvSeries,
  ) : super(NowPlayingTvSeriesState.initial());

  Future<void> fetchNowPlayingTvSeries() async {
    emit(state.copyWith(moviesState: RequestState.loading));
    final result = await getNowPlayingTvSeries.execute();
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
