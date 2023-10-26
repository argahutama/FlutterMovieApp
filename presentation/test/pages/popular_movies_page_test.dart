import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/cubits/popular_movies_cubit.dart';
import 'package:presentation/pages/popular_movies_page.dart';

class MockPopularMoviesCubit extends MockCubit<PopularMoviesState>
    implements PopularMoviesCubit {}

void main() {
  late MockPopularMoviesCubit mockPopularMoviesCubit;

  setUp(() {
    mockPopularMoviesCubit = MockPopularMoviesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<PopularMoviesCubit>.value(
      value: mockPopularMoviesCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesCubit.state).thenReturn(
      PopularMoviesState.initial().copyWith(moviesState: RequestState.loading),
    );

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(progressBarFinder, findsOneWidget);
    expect(centerFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesCubit.state)
        .thenReturn(const PopularMoviesState(
      movies: [],
      moviesState: RequestState.loaded,
      message: '',
    ));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesCubit.state)
        .thenReturn(PopularMoviesState.initial().copyWith(
      moviesState: RequestState.error,
      message: 'Error message',
    ));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
