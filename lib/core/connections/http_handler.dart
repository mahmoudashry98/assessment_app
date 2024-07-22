import 'dart:developer';

import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages

import '../exception/api_failure.dart';

dio.Response<dynamic> responseHandler(
  dio.Response<dynamic> response,
) {
  log(response.toString());
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      final Map<String, dynamic> jsonResponse = response.data as Map<String, dynamic>;

      if (jsonResponse.containsKey('status')) {
        if (jsonResponse['status'] < 200 || jsonResponse['status'] > 205) {
          throw Failure(
            message: jsonResponse['message'] as String,
            details: jsonResponse['error'],
            errorCode: jsonResponse['statusCode'],
          );
        }
      }
      return response;

    case 500:
      throw Failure(message: 'Server Error please retry later');
    case 403:
      throw Failure(
        message: 'Error occurred please check internet and retry.',
      );
    case 400:
      throw Failure(
        message: 'Bad request.',
      );
    case 404:
      throw Failure(message: 'Page not found');
    case 405:
      throw Failure(message: 'Authorization problem, Please login again');
    default:
      throw Failure(message: 'Error occurred retry');
  }
}
