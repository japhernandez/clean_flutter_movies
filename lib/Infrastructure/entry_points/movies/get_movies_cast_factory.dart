import 'package:clean_flutter_movies/Infrastructure/entry_points/entry_points.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/env.dart';

GetMoviesCastRepositoryAdapter makeGetMoviesCastFactory() {
  var param = "0";
  return GetMoviesCastRepositoryAdapter(
    url: makeApiUrl('movie/$param/credits', keyMovies, ""),
    httpClientRepository: makeHttpAdapterFactory(),
  );
}
