import 'package:clean_flutter_movies/Domain/entities/entities.dart';

abstract class GetMoviesSearchRepository {
  Future<MovieResultEntity> getMovieSearch();
}