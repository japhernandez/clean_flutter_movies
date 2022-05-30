import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/adapters/base_repository_adapter.dart';

class GetMoviesPopularRepositoryAdapter extends BaseRepositoryAdapter {
  GetMoviesPopularRepositoryAdapter(
      {required super.url, required super.httpClientRepository});
}
