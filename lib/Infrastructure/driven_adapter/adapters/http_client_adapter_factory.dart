import 'package:http/http.dart';
import 'package:clean_flutter_movies/Domain/use_cases/use_cases.dart';

HttpClientRepository makeHttpAdapterFactory() => HttpService(Client());
