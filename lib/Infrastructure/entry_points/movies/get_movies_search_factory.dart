import 'package:clean_flutter_movies/env.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/entry_points/entry_points.dart';

GetMoviesSearchRepositoryAdapter makeGetMoviesSearchFactory() {
  return GetMoviesSearchRepositoryAdapter(
    url: makeApiUrl('search/movie/', keyMovies, ''),
    httpClientRepository: makeHttpAdapterFactory(),
  );
}
