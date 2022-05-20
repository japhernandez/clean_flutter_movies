import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';
import 'package:clean_flutter_movies/Domain/use_cases/use_cases.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';

import 'contracts/contracts.dart';
import 'models/models.dart';

class GetMoviesToRatedRepositoryAdapter implements GetMoviesTopRatedRepository {
  final String url;
  final HttpClientRepository httpClientRepository;

  GetMoviesToRatedRepositoryAdapter({
    required this.url,
    required this.httpClientRepository,
  });

  @override
  Future<MovieResultEntity> getMoviesTopRated() async {
    try {
      final response = await httpClientRepository.request(url: url, method: "GET");
      return RemoteMovieResultsModel.fromJson(response).toEntity();
    } on HttpError catch (err) {
      print('Error response => $err');
      rethrow;
    }
  }
}
