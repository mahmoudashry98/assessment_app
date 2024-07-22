// ignore_for_file: non_constant_identifier_names


import 'package:dio/dio.dart';

import '../../values/constants.dart';

class DioClient {
  static Dio get DIO_CLIENT {
    final Dio dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(minutes: 2), // 60 seconds
          receiveTimeout: const Duration(minutes: 2)),
    );

    return dio;
  }
}
