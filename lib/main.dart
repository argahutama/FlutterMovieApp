import 'package:common/common.dart';
import 'package:common/constants.dart';
import 'package:common/di/injection.dart';
import 'package:common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/about_page.dart';
import 'package:presentation/pages/home_movie_page.dart';
import 'package:presentation/pages/movie_detail_page.dart';
import 'package:presentation/pages/popular_movies_page.dart';
import 'package:presentation/pages/search_page.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';
import 'package:presentation/pages/watchlist_movies_page.dart';
import 'package:presentation/provider/movie_detail_notifier.dart';
import 'package:presentation/provider/movie_list_notifier.dart';
import 'package:presentation/provider/movie_search_notifier.dart';
import 'package:presentation/provider/popular_movies_notifier.dart';
import 'package:presentation/provider/top_rated_movies_notifier.dart';
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
            create: (_) => getIt<MovieListNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<MovieDetailNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<MovieSearchNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<TopRatedMoviesNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<PopularMoviesNotifier>(),
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
          home: const HomeMoviePage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (_) => const HomeMoviePage(),
                );
              case PopularMoviesPage.routeName:
                return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage(),
                );
              case TopRatedMoviesPage.routeName:
                return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage(),
                );
              case MovieDetailPage.routeName:
                final id = settings.arguments as int;
                return MaterialPageRoute(
                  builder: (_) => MovieDetailPage(id: id),
                  settings: settings,
                );
              case SearchPage.routeName:
                return CupertinoPageRoute(builder: (_) => const SearchPage());
              case WatchlistMoviesPage.routeName:
                return MaterialPageRoute(
                    builder: (_) => const WatchlistMoviesPage());
              case AboutPage.routeName:
                return MaterialPageRoute(builder: (_) => const AboutPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ),
      );
}
