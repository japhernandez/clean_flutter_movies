import 'package:clean_flutter_movies/Domain/entities/entities.dart';
import 'package:clean_flutter_movies/Domain/use_cases/use_cases.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/env.dart';

class GetMoviesCastRepositoryAdapter implements GetMoviesCastRepository {
  final String url;
  final HttpClientRepository httpClientRepository;

  GetMoviesCastRepositoryAdapter(
      {required this.url, required this.httpClientRepository});

  @override
  Future<CastResultsEntity> getMoviesCast(movieId) async {
    final resultUrl =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$keyMovies&query=";

    try {
      final response =
          await httpClientRepository.request(url: resultUrl, method: "GET");
      return RemoteCastResultsModel.fromJson(response).toEntity();
    } on HttpError {
      rethrow;
    }
  }
}
