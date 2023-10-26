import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/cubits/top_rated_movies_cubit.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';

class MockTopRatedMoviesCubit extends MockCubit<TopRatedMoviesState>
    implements TopRatedMoviesCubit {}

void main() {
  late MockTopRatedMoviesCubit mockTopRatedMoviesCubit;

  setUp(() {
    mockTopRatedMoviesCubit = MockTopRatedMoviesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMoviesCubit>.value(
      value: mockTopRatedMoviesCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTopRatedMoviesCubit.state).thenReturn(
      TopRatedMoviesState.initial().copyWith(
        moviesState: RequestState.loading,
      ),
    );

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTopRatedMoviesCubit.state).thenReturn(
      TopRatedMoviesState.initial().copyWith(
        movies: [],
        moviesState: RequestState.loaded,
      ),
    );

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTopRatedMoviesCubit.state)
        .thenReturn(TopRatedMoviesState.initial().copyWith(
      moviesState: RequestState.error,
      message: 'Error message',
    ));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
