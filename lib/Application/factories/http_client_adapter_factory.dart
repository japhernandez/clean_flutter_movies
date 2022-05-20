import 'package:http/http.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';

HttpClientRepository makeHttpAdapterFactory () => HttpAdapter(Client());