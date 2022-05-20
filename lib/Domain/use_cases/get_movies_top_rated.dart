import 'package:clean_flutter_movies/Domain/entities/entities.dart';

abstract class GetMoviesTopRatedRepository {
  Future<MovieResultEntity> getMoviesTopRated();
}