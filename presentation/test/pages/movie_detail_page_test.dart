import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:common/state_enum.dart';
import 'package:domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/cubits/movie_detail_cubit.dart';
import 'package:presentation/pages/movie_detail_page.dart';

import '../dummy_data/dummy_objects.dart';

class MockMovieDetailCubit extends MockCubit<MovieDetailState>
    implements MovieDetailCubit {}

void main() {
  late MockMovieDetailCubit mockDetailMovieCubit;

  setUp(() {
    mockDetailMovieCubit = MockMovieDetailCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailCubit>.value(
      value: mockDetailMovieCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockDetailMovieCubit.addWatchlist(any()))
        .thenAnswer((_) async {});
    when(() => mockDetailMovieCubit.state).thenReturn(
      MovieDetailState.empty().copyWith(
        movieState: RequestState.loaded,
        movie: testMovieDetail,
        recommendationState: RequestState.loaded,
        movieRecommendations: <Movie>[],
        isAddedToWatchlist: false,
      ),
    );

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(makeTestableWidget(const MovieDetailPage(isMovie: true)));
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display check icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(() => mockDetailMovieCubit.removeFromWatchlist(any()))
        .thenAnswer((_) async {});
    when(() => mockDetailMovieCubit.state).thenReturn(
      MovieDetailState.empty().copyWith(
        movieState: RequestState.loaded,
        movie: testMovieDetail,
        recommendationState: RequestState.loaded,
        movieRecommendations: [testWatchlistMovie],
        isAddedToWatchlist: true,
      ),
    );

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(
      isMovie: true,
    )));
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Show display snack bar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
      mockDetailMovieCubit,
      Stream.fromIterable([
        MovieDetailState.empty().copyWith(
          isAddedToWatchlist: false,
        ),
        MovieDetailState.empty().copyWith(
          isAddedToWatchlist: false,
          watchlistMessage: 'Added to Watchlist',
        ),
      ]),
      initialState: MovieDetailState.empty(),
    );

    final snackBar = find.byType(SnackBar);
    final textMessage = find.text('Added to Watchlist');

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(
      isMovie: true,
    )));

    expect(snackBar, findsNothing);
    expect(textMessage, findsNothing);

    await tester.pump();

    expect(snackBar, findsOneWidget);
    expect(textMessage, findsOneWidget);
  });

  testWidgets('Show display alert dialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
      mockDetailMovieCubit,
      Stream.fromIterable([
        MovieDetailState.empty().copyWith(
          isAddedToWatchlist: false,
        ),
        MovieDetailState.empty().copyWith(
          isAddedToWatchlist: false,
          watchlistMessage: 'Failed Add to Watchlist',
        ),
      ]),
      initialState: MovieDetailState.empty(),
    );

    final alertDialog = find.byType(AlertDialog);
    final textMessage = find.text('Failed Add to Watchlist');

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(
      isMovie: true,
    )));

    expect(alertDialog, findsNothing);
    expect(textMessage, findsNothing);

    await tester.pump();

    expect(alertDialog, findsOneWidget);
    expect(textMessage, findsOneWidget);
  });

  testWidgets(
      'Movie detail page should display error text when no internet network',
      (WidgetTester tester) async {
    when(() => mockDetailMovieCubit.state).thenReturn(
      MovieDetailState.empty().copyWith(
        movieState: RequestState.error,
        message: 'Failed to connect to the network',
      ),
    );

    final textErrorBarFinder = find.text('Failed to connect to the network');

    await tester
        .pumpWidget(makeTestableWidget(const MovieDetailPage(isMovie: true)));
    await tester.pump();

    expect(textErrorBarFinder, findsOneWidget);
  });

  testWidgets(
      'Recommendations Movies should display error text when get data is unsuccessful',
      (WidgetTester tester) async {
    when(() => mockDetailMovieCubit.state).thenReturn(
      MovieDetailState.empty().copyWith(
        movieState: RequestState.loaded,
        movie: testMovieDetail,
        recommendationState: RequestState.error,
        message: 'Error',
        isAddedToWatchlist: false,
      ),
    );

    final textErrorBarFinder = find.text('Error');

    await tester
        .pumpWidget(makeTestableWidget(const MovieDetailPage(isMovie: true)));
    await tester.pump();

    expect(textErrorBarFinder, findsOneWidget);
  });
}
