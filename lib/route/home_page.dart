import 'package:common/common.dart';
import 'package:common/di/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/cubits/movie_list_cubit.dart';
import 'package:presentation/pages/home_movie_page.dart';

Widget get homePage => BlocProvider(
  create: (context) => getIt<MovieListCubit>()
    ..fetchNowPlayingMovies()
    ..fetchPopularMovies()
    ..fetchTopRatedMovies(),
  child: const HomeMoviePage(),
);