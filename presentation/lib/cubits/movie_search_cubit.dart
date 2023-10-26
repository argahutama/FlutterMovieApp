import 'package:common/common.dart';

part 'movie_search_state.dart';
part 'movie_search_cubit.freezed.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit() : super(const MovieSearchState.initial());
}
