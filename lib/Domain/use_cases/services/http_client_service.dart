import 'dart:convert';
import 'package:http/http.dart';

import 'package:clean_flutter_movies/Infrastructure/shared/shared.dart';
import 'package:clean_flutter_movies/Domain/use_cases/contracts/http_client_repository.dart';

class HttpService implements HttpClientRepository {
  final Client client;

  HttpService(this.client);

  @override
  Future request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);

    Future<Response>? futureResponse;

    try {
      switch (method) {
        case 'POST':
          futureResponse = client.post(Uri.parse(url), body: jsonBody);
          break;
        case 'GET':
          futureResponse = client.get(Uri.parse(url));
          break;
        default:
      }
      response = await futureResponse!.timeout(const Duration(seconds: 10));
    } catch (error) {
      throw HttpError.serverError;
    }

    return handleResponse(response);
  }
}
