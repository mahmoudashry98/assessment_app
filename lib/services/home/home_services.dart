import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:test_project/core/connections/product/dio_client.dart';
import 'package:test_project/core/exception/api_failure.dart';
import 'package:test_project/modules/home/data/product_model.dart';

class HomeServices {
  static Future<Either<Products, Failure>> getProducts() async {
    try {
      final Response response = await DioClient.DIO_CLIENT.get('/products');
      // Ensure the response data is a list
      if (response.data is List) {
        Products products = Products.fromJson(response.data);
        return left(products);
      } else {
        return right(Failure(message: 'Unexpected response format'));
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      if (e.response != null) {
        debugPrint('Response status: ${e.response?.statusCode}');
        debugPrint('Response data: ${e.response?.data}');
      }
      return right(Failure(message: 'Network error: ${e.message}'));
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return right(Failure(message: 'Error while formatting data'));
    }
  }
}
