import 'package:common/common.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final int? isMovie;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.isMovie,
  });

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
        isMovie: movie.isMovie == true ? 1 : 0,
      );

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        isMovie: map['isMovie'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'isMovie': isMovie,
      };

  Movie toEntity() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
        isMovie: isMovie == 1 ? true : false,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview, isMovie];
}
