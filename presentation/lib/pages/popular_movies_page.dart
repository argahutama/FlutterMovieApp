import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:presentation/cubits/popular_movies_cubit.dart';
import 'package:presentation/widgets/movie_card_list.dart';

class PopularMoviesPage extends StatelessWidget {
  static const routeName = '/popular-movie';

  const PopularMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            if (state.moviesState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.moviesState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return MovieCard(movie);
                },
                itemCount: state.movies.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            }
          },
        ),
      ),
    );
  }
}
