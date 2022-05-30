import 'package:clean_flutter_movies/env.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/entry_points/entry_points.dart';

GetMoviesToRatedRepositoryAdapter makeGetMoviesToRateFactory() =>
    GetMoviesToRatedRepositoryAdapter(
      url: makeApiUrl('movie/top_rated', keyMovies, ""),
      httpClientRepository: makeHttpAdapterFactory(),
    );
