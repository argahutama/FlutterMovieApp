import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:presentation/cubits/now_playing_tv_series_cubit.dart';
import 'package:presentation/widgets/movie_card_list.dart';

class NowPlayingTvSeriesPage extends StatelessWidget {
  static const routeName = '/now-playing-tv-series';

  const NowPlayingTvSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTvSeriesCubit, NowPlayingTvSeriesState>(
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
