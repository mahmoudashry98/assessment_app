// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/modules/home/data/product_model.dart';

class CartScreen extends StatelessWidget {
  // final Product product;
  const CartScreen({
    Key? key,
    // required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          // ListView.separated(
          //   itemBuilder: itemBuilder,
          //   separatorBuilder: separatorBuilder,
          //   itemCount: itemCount,
          // ),
        ],
      ),
    );
  }
}
