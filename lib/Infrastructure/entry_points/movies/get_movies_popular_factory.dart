import 'package:clean_flutter_movies/env.dart';
import 'package:clean_flutter_movies/Application/config/config.dart';
import 'package:clean_flutter_movies/Application/factories/factories.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/get_movies_popular_repository_adapter.dart';

GetMoviesPopularRepositoryAdapter makeGetMoviesPopularFactory() => GetMoviesPopularRepositoryAdapter(
    url: makeApiUrl('movie/popular', keyMovies, ""),
    httpClientRepository: makeHttpAdapterFactory()
);