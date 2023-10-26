import 'package:common/common.dart';

part 'tv_series_list_state.dart';
part 'tv_series_list_cubit.freezed.dart';

class TvSeriesListCubit extends Cubit<TvSeriesListState> {
  TvSeriesListCubit() : super(const TvSeriesListState.initial());
}
