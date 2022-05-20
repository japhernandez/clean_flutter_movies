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
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  int? voteCount;

  RemoteMovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteCount,
  });

  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory RemoteMovieModel.fromJson(Map json) {
    return RemoteMovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteCount: json['vote_count'],
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
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteCount: voteCount,
      );
}
