import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';
import 'package:clean_flutter_movies/Domain/use_cases/get_movies_popular.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/models/remote_movies_result_model.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';

class GetMoviesPopularRepositoryAdapter implements GetMoviesPopularRepository {
  final String url;
  final HttpClientRepository httpClientRepository;

  GetMoviesPopularRepositoryAdapter({
    required this.url,
    required this.httpClientRepository,
  });

  @override
  Future<MovieResultEntity> getMoviesPopular() async {
    try {
      final response = await httpClientRepository.request(url: url, method: "GET");
      return RemoteMovieResultsModel.fromJson(response).toEntity();
    } on HttpError catch (err) {
      print('Error response => $err');
      rethrow;
    }
  }
}
