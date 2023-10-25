import 'package:common/common.dart';
import 'package:common/constants.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/providers.dart';
import 'package:flutter_movie_app/route.dart';
import 'package:presentation/pages/home_movie_page.dart';

import '../di/injection.dart' as di;

void main() {
  di.getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
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
          onGenerateRoute: onGenerateRoute,
        ),
      );
}
