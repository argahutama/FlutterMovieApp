import 'package:common/common.dart';

part 'tv_series_search_state.dart';
part 'tv_series_search_cubit.freezed.dart';

class TvSeriesSearchCubit extends Cubit<TvSeriesSearchState> {
  TvSeriesSearchCubit() : super(const TvSeriesSearchState.initial());
}
