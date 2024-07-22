import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/core/utils/widgets/app_icon_widget.dart';
import 'package:test_project/modules/home/controller/cubit.dart';
import 'package:test_project/modules/home/controller/states.dart';
import 'package:test_project/modules/home/ui/product_details.dart';

class FeaturedBikeContainer extends StatefulWidget {
  const FeaturedBikeContainer({super.key});

  @override
  FeaturedBikeContainerState createState() => FeaturedBikeContainerState();
}

class FeaturedBikeContainerState extends State<FeaturedBikeContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchInitialProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        debugPrint("Reached the bottom of the list");
        context.read<HomeCubit>().fetchProducts();
      }
    });
  }

  void _fetchInitialProducts() {
    context.read<HomeCubit>().fetchProducts(isInitial: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeStateInitial || state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded || state is ProductLoadingMore) {
          return GridView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.products.length + (state is ProductLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.products.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final product = state.products[index];
              return GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductDetails(product: product,))),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xfff353f54), Color(0xfff222834)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: product.images[0],
                              imageBuilder: (context, imageProvider) => Container(
                                height: 80,
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
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    product.title,
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '\$ ${product.price}',
                              style: TextStyle(
                                color: AppColors.whiteColor.withOpacity(0.4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 5,
                        child: GradientIcon(
                          icon: Icons.favorite_border,
                          size: 30,
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF34CAE8),
                              Color(0xFF4E49F2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: _fetchInitialProducts,
              child: const Text('Load Products'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
