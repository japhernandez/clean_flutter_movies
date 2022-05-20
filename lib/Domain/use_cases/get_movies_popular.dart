import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';

abstract class GetMoviesPopularRepository {
  Future<MovieResultEntity> getMoviesPopular();
}