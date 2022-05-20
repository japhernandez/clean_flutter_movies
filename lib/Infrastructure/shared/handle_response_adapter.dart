import 'dart:convert';
import 'package:http/http.dart';
import 'package:clean_flutter_movies/Infrastructure/shared/http_error.dart';

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.body.isEmpty ? null : jsonDecode(response.body);
    case 204:
      return null;
    case 400:
      throw HttpError.badRequest;
    case 401:
      throw HttpError.unauthorized;
    case 404:
      throw HttpError.notFound;
    default:
      throw HttpError.serverError;
  }
}