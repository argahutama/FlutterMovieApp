import 'package:common/common.dart';

part 'watchlist_movies_state.dart';
part 'watchlist_movies_cubit.freezed.dart';

class WatchlistMoviesCubit extends Cubit<WatchlistMoviesState> {
  WatchlistMoviesCubit() : super(const WatchlistMoviesState.initial());
}
