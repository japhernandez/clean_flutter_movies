import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/entry_points/entry_points.dart';
import 'package:clean_flutter_movies/env.dart';

GetMoviesPopularRepositoryAdapter makeGetMoviesPopularFactory() {
  return GetMoviesPopularRepositoryAdapter(
      url: makeApiUrl('movie/popular', keyMovies, ""),
      httpClientRepository: makeHttpAdapterFactory());
}
