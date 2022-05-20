import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';

class RemoteMovieResultsModel {
  int? page;
  List<RemoteMovieModel> movies;
  int? totalPages;
  int? totalResults;

  RemoteMovieResultsModel(
      {this.page, required this.movies, this.totalPages, this.totalResults});

  factory RemoteMovieResultsModel.fromJson(Map json) {
    return RemoteMovieResultsModel(
        page: json['page'],
        movies: json['results']
            .map<RemoteMovieModel>(
                (movieJson) => RemoteMovieModel.fromJson(movieJson))
            .toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }

  MovieResultEntity toEntity() => MovieResultEntity(
      movies: movies.map((movie) => movie.toEntity()).toList());
}

class RemoteMovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  RemoteMovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
  });

  factory RemoteMovieModel.fromJson(Map json) {
    return RemoteMovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
    );
  }

  MovieEntity toEntity() => MovieEntity(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
      );
}
