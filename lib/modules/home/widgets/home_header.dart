// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/core/utils/widgets/icon_button_widget.dart';

class HomeHeader extends StatelessWidget {
  final String? text;
  final bool? isActionIcon;
  final String? image;
  
  const HomeHeader({Key? key, this.text, this.isActionIcon = false, this.image,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActionIcon == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      text!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              IconButtonWidget(
                size: 44,
                iconSize: 20,
                borderRadius: 12,
                gradientColors: const [
                  Color(0xFF34CAE8),
                  Color(0xFF4E49F2),
                ],
                image: image!,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: IconButtonWidget(
                  size: 44,
                  iconSize: 20,
                  borderRadius: 12,
                  gradientColors: const [
                    Color(0xFF34CAE8),
                    Color(0xFF4E49F2),
                  ],
                  image: image,
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 190,
                child: Text(
                  text!,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              const Icon(null),
            ],
          );
  }
}
