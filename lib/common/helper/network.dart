import 'dart:convert';

import 'package:http/http.dart';

import 'failure.dart';
import 'storage.dart';

abstract class Network {
  Future<NetworkResponse> get(String url, {Map<String, String>? headers});

  Future<NetworkResponse> post(String url,
      {Map<String, String>? headers, Object? body});

  Future<NetworkResponse> put(String url,
      {Map<String, String>? headers, Object? body});

  Future<NetworkResponse> delete(String url,
      {Map<String, String>? headers, Object? body});
}

class NetworkResponse {
  final String body;
  final int status;
  final Map<String, String> headers;

  NetworkResponse({
    required this.body,
    required this.status,
    required this.headers,
  });
}

class NetworkClient implements Network {
  NetworkClient._();

  static final NetworkClient _instance = NetworkClient._();

  factory NetworkClient() {
    return _instance;
  }

  final _http = Client();
  final _storage = Storage();

  @override
  Future<NetworkResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = await _headers(headers);
    final request = await _http.get(Uri.parse(url), headers: defaultHeaders);

    if (request.statusCode >= 400) {
      _exception(request);
    }

    final response = _response(request);

    return response;
  }

  @override
  Future<NetworkResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final defaultHeaders = await _headers(headers);
    final request = await _http.post(Uri.parse(url),
        headers: defaultHeaders, body: jsonEncode(body));

    if (request.statusCode >= 400) {
      _exception(request);
    }

    final response = _response(request);

    return response;
  }

  @override
  Future<NetworkResponse> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final defaultHeaders = await _headers(headers);
    final request = await _http.put(Uri.parse(url),
        headers: defaultHeaders, body: jsonEncode(body));

    if (request.statusCode >= 400) {
      _exception(request);
    }

    final response = _response(request);

    return response;
  }

  @override
  Future<NetworkResponse> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final defaultHeaders = await _headers(headers);
    final request = await _http.delete(Uri.parse(url),
        headers: defaultHeaders, body: jsonEncode(body));

    if (request.statusCode >= 400) {
      _exception(request);
    }

    final response = _response(request);

    return response;
  }

  Future<Map<String, String>> _headers(Map<String, String>? headers) async {
    final authToken = await _storage.read('auth');
    final defaultHeaders = {'Content-Type': 'application/json'};
    final mergedHeaders =
        headers == null ? defaultHeaders : {...defaultHeaders, ...headers};

    if (authToken != null) {
      mergedHeaders['Authorization'] = 'Bearer $authToken';
    }

    return mergedHeaders;
  }

  NetworkResponse _response(Response request) {
    final response = NetworkResponse(
      body: request.body,
      status: request.statusCode,
      headers: request.headers,
    );

    return response;
  }

  Exception _exception(Response response) {
    final code = response.statusCode;
    final body = jsonDecode(response.body);

    if (code == 401) {
      throw Unauthorized(message: body);
    } else if (code == 404) {
      throw NotFound(message: body);
    } else if (code >= 400 && code <= 499) {
      throw BadRequest(message: body);
    } else {
      throw InternalFailure(message: body);
    }
  }
}
