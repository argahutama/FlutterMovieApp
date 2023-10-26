import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/search_tv_series.dart';

part 'tv_series_search_cubit.freezed.dart';

part 'tv_series_search_state.dart';

class TvSeriesSearchCubit extends Cubit<TvSeriesSearchState> {
  final SearchTvSeries searchTvSeries;

  TvSeriesSearchCubit(
    this.searchTvSeries,
  ) : super(TvSeriesSearchState.initial());

  void fetchMovieSearch(String query) async {
    emit(state.copyWith(tvSeriesState: RequestState.loading));
    final result = await searchTvSeries.execute(query);
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
