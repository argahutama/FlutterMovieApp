import 'package:common/common.dart';

part 'top_rated_movies_state.dart';
part 'top_rated_movies_cubit.freezed.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit() : super(const TopRatedMoviesState.initial());
}
