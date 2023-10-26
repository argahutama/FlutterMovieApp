import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/get_popular_movies.dart';

part 'popular_movies_cubit.freezed.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesCubit(
    this.getPopularMovies,
  ) : super(PopularMoviesState.initial());

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(moviesState: RequestState.loading));
    final result = await getPopularMovies.execute();
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
