import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';

class PromoContainer extends StatelessWidget {
  const PromoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
          Center(
            child: Image.asset('assets/images/Electric%20Bicycle.I05 2.png'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                '30% Off',
                style: TextStyle(
                  color: AppColors.whiteColor.withOpacity(0.6),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
