import 'package:flutter/material.dart';
import 'package:test_project/core/utils/widgets/function_widget.dart';
import 'package:test_project/core/utils/widgets/icon_button_widget.dart';

class IconButtonsRow extends StatelessWidget {
  const IconButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: FunctionWidget.iconButtonsConfig.map((config) {
        return IconButtonWidget(
          size: config['size'],
          text: config['text'],
          borderRadius: config['borderRadius'],
          image: config['image'],
          gradientColors: config['gradientColors'],
        );
      }).toList(),
    );
  }
}
