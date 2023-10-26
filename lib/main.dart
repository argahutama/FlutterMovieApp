import 'package:common/common.dart';
import 'package:common/constants.dart';
import 'package:common/di/injection.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/route/home_page.dart';
import 'package:flutter_movie_app/route/route.dart';
import 'package:presentation/provider/movie_detail_notifier.dart';
import 'package:presentation/provider/movie_search_notifier.dart';
import 'package:presentation/provider/popular_movies_notifier.dart';
import 'package:presentation/provider/popular_tv_series_notifier.dart';
import 'package:presentation/provider/top_rated_movies_notifier.dart';
import 'package:presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:presentation/provider/tv_series_search_notifier.dart';
import 'package:presentation/provider/watchlist_movie_notifier.dart';

import '../di/injection.dart' as di;

void main() {
  di.getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => getIt<MovieDetailNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<MovieSearchNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<TvSeriesSearchNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<TopRatedMoviesNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<TopRatedTvSeriesNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<PopularMoviesNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<PopularTvSeriesNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<WatchlistMovieNotifier>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            colorScheme: kColorScheme,
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack,
            textTheme: kTextTheme,
          ),
          home: homePage,
          navigatorObservers: [routeObserver],
          onGenerateRoute: onGenerateRoute,
        ),
      );
}
