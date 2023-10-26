import 'package:common/common.dart';
import 'package:common/constants.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:presentation/cubits/tv_series_search_cubit.dart';
import 'package:presentation/widgets/movie_card_list.dart';

class SearchTvSeriesPage extends StatelessWidget {
  static const routeName = '/search-tv-series';

  const SearchTvSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: context.read<TvSeriesSearchCubit>().fetchMovieSearch,
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
            BlocBuilder<TvSeriesSearchCubit, TvSeriesSearchState>(
              builder: (context, state) {
                if (state.tvSeriesState == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.tvSeriesState == RequestState.loaded) {
                  final result = state.tvSeries;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = state.tvSeries[index];
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
