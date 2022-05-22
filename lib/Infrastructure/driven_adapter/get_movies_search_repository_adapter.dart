import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';
import 'package:clean_flutter_movies/Domain/use_cases/get_movies_search.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/models/models.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';

import 'contracts/contracts.dart';

class GetMoviesSearchRepositoryAdapter implements GetMoviesSearchRepository  {
  final String url;
  final HttpClientRepository httpClientRepository;

  GetMoviesSearchRepositoryAdapter({required this.url, required this.httpClientRepository});

  @override
  Future<MovieResultEntity> getMovieSearch() async {
    print("url services");
    print(url);

    try {
      final response = await httpClientRepository.request(url: url, method: "GET");
      return RemoteMovieResultsModel.fromJson(response).toEntity();
    } on HttpError catch (err) {
      print('Error response => $err');
      rethrow;
    }
  }

}