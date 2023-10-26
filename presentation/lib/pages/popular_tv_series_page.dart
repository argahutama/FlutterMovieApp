import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:presentation/cubits/popular_tv_series_cubit.dart';
import 'package:presentation/widgets/movie_card_list.dart';

class PopularTvSeriesPage extends StatelessWidget {
  static const routeName = '/popular-tv-series';

  const PopularTvSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesCubit, PopularTvSeriesState>(
          builder: (context, state) {
            if (state.tvSeriesState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.tvSeriesState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.tvSeries[index];
                  return MovieCard(movie);
                },
                itemCount: state.tvSeries.length,
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
