import 'package:common/constants.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/route/home_page.dart';
import 'package:flutter_movie_app/route/route.dart';

import '../di/injection.dart' as di;

void main() {
  di.getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
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
      );
}
