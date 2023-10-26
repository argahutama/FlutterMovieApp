import 'package:common/common.dart';
import 'package:common/constants.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:presentation/cubits/movie_search_cubit.dart';
import 'package:presentation/widgets/movie_card_list.dart';

class SearchMoviesPage extends StatelessWidget {
  static const routeName = '/search-movies';

  const SearchMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: context.read<MovieSearchCubit>().fetchMovieSearch,
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<MovieSearchCubit, MovieSearchState>(
              builder: (context, state) {
                if (state.moviesState == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.moviesState == RequestState.loaded) {
                  final result = state.movies;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieCard(movie);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
