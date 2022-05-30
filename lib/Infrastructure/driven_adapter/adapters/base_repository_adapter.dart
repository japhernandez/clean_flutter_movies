import 'dart:async';

import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';
import 'package:clean_flutter_movies/Domain/use_cases/contracts/base_movies_repository.dart';
import 'package:clean_flutter_movies/Domain/use_cases/use_cases.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';

class BaseRepositoryAdapter<T> implements GetBaseMoviesRepository {
  final String url;
  final HttpClientRepository httpClientRepository;

  BaseRepositoryAdapter(
      {required this.url, required this.httpClientRepository});

  @override
  Future<MovieResultEntity> getMovies([String query = ""]) async {
    final urlResult = query.isNotEmpty ? '$url$query' : url;

    try {
      final response =
          await httpClientRepository.request(url: urlResult, method: "GET");
      return RemoteMovieResultsModel.fromJson(response).toEntity();
    } on HttpError catch (_) {
      rethrow;
    }
  }
}
