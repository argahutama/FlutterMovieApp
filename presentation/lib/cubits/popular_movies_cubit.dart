import 'package:common/common.dart';

part 'popular_movies_cubit.freezed.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(const PopularMoviesState.initial());
}
