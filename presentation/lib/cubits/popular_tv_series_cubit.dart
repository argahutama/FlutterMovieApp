import 'package:common/common.dart';

part 'popular_tv_series_state.dart';
part 'popular_tv_series_cubit.freezed.dart';

class PopularTvSeriesCubit extends Cubit<PopularTvSeriesState> {
  PopularTvSeriesCubit() : super(const PopularTvSeriesState.initial());
}
