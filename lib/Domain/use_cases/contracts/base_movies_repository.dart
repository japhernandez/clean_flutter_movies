import 'package:clean_flutter_movies/Domain/entities/entities.dart';

abstract class GetBaseMoviesRepository {
  Future<MovieResultEntity> getMovies([String query]);
}
