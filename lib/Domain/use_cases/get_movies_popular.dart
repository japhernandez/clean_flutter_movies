import 'package:clean_flutter_movies/Domain/entities/movie_entity.dart';

abstract class GetMoviesPopular {
  Future<MovieEntity> getMoviesPopular();
}