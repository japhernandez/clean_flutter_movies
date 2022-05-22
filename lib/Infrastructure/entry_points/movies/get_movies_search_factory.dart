import 'dart:async';

import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';
import 'package:clean_flutter_movies/env.dart';
import 'package:clean_flutter_movies/Application/config/config.dart';
import 'package:clean_flutter_movies/Application/factories/factories.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/get_movies_search_repository_adapter.dart';

final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

GetMoviesSearchRepositoryAdapter? makeGetMoviesSearchFactory(
    [String query = ""]) {
  return GetMoviesSearchRepositoryAdapter(
    url: makeApiUrl('search/movie/', keyMovies, "batman"),
    httpClientRepository: makeHttpAdapterFactory(),
  );
}

getSuggestionsByQuery([String query = ""]) {
  GetMoviesSearchRepositoryAdapter? response;
  debouncer.value = '';
  debouncer.onValue = (value) async {

    print("Tenemos valor a buscar ===== 1: $value");
     final url =  makeApiUrl('search/movie/', keyMovies, value);
     print("url ========== ");
     print(url);
      response = GetMoviesSearchRepositoryAdapter(
        url: url, // makeApiUrl('search/movie/', keyMovies, "batman"),
        httpClientRepository: makeHttpAdapterFactory(),
      );

    print("response ========== ");
    print(response!.url);
  };


  final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
    debouncer.value = query;
  });

  Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
}
