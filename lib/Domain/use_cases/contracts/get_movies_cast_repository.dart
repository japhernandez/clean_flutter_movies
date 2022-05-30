import 'package:clean_flutter_movies/Domain/entities/entities.dart';

abstract class GetMoviesCastRepository {
  Future<CastResultsEntity> getMoviesCast(movieId);
}
