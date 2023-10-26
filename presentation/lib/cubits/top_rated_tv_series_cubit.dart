import 'package:common/common.dart';

part 'top_rated_tv_series_state.dart';
part 'top_rated_tv_series_cubit.freezed.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  TopRatedTvSeriesCubit() : super(const TopRatedTvSeriesState.initial());
}
