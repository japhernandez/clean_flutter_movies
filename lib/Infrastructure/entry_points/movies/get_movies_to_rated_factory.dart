import 'package:clean_flutter_movies/Application/config/config.dart';
import 'package:clean_flutter_movies/Application/factories/factories.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/env.dart';

GetMoviesToRatedRepositoryAdapter makeGetMoviesToRateFactory() =>
    GetMoviesToRatedRepositoryAdapter(
      url: makeApiUrl('movie/top_rated', keyMovies),
      httpClientRepository: makeHttpAdapterFactory(),
    );
