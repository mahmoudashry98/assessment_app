import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';

class IconButtonWidget extends StatelessWidget {
  final double? size;
  final double? iconSize;
  final double borderRadius;
  final Color? color;
  final String? image;
  final List<Color> gradientColors;
  final String? text;

  const IconButtonWidget(
      {super.key,
      this.size,
      this.iconSize,
      required this.borderRadius,
      this.color,
      this.image,
      this.gradientColors = const [Color(0xFF353F54), Color(0xFF222834)],
      this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 13, // Adjust text size relative to iconSize
                  fontWeight: FontWeight.w500,
                ),
              )
            : Image.asset(image!),
      ),
    );
  }
}


