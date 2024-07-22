// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/core/utils/widgets/function_widget.dart';
import 'package:test_project/core/utils/widgets/gradient_elevated_button.dart';
import 'package:test_project/core/utils/widgets/gradient_text.dart';
import 'package:test_project/modules/home/data/product_model.dart';
import 'package:test_project/modules/home/widgets/home_header.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: HomeHeader(
              text: product.title,
              isActionIcon: false,
              image: 'assets/icons/chevron.left.png',
            ),
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: product.images[0],
                  imageBuilder: (context, imageProvider) => Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  placeholder: (context, url) {
                    debugPrint("Loading image: $url");
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, error) {
                    debugPrint("Error loading image: $url, error: $error");
                    return const Icon(Icons.error);
                  },
                ),
                const SizedBox(height: 10),
                if (product.images.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 24.0,
                        width: 78,
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: List.generate(4, (int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              width: FunctionWidget.getCircleSize(1, 2),
                              height: FunctionWidget.getCircleSize(1, 2),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.53,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF353F54), Color(0xFF222834)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          color: const Color(0xFF353F54),
                          shadowColor: Colors.white.withOpacity(0.1),
                          elevation: 5,
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                                color: const Color(0xFF353F54), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: GradientText(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF3CA4EB),
                                    Color(0xFF4286EE),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: AppColors.whiteColor,
                                text: 'Description',
                                normalColor: false,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: const Color(0xFF28303F),
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                                color: const Color(0xFF28303F), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: GradientText(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF3CA4EB),
                                    Color(0xFF4286EE),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: AppColors.whiteColor,
                                text: 'Specification',
                                normalColor: true,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.description,
                          style: TextStyle(
                            color: AppColors.whiteColor.withOpacity(0.4),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 35, 42, 55), borderRadius: BorderRadius.circular(35)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                        color: Color(0xFF3D9CEA),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GradientElevatedButton(
                      onPressed: () {},
                      child: Text('Add to Cart',
                          style: TextStyle(
                              fontSize: 15, color: AppColors.whiteColor, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
