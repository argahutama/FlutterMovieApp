import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/usecases/search_movies.dart';

part 'movie_search_cubit.freezed.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final SearchMovies searchMovies;

  MovieSearchCubit(
    this.searchMovies,
  ) : super(MovieSearchState.initial());

  void fetchMovieSearch(String query) async {
    emit(state.copyWith(moviesState: RequestState.loading));
    final result = await searchMovies.execute(query);
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
