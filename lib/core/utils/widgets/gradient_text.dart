import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final Color color;
  final bool normalColor;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.color = Colors.white,
    this.normalColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return normalColor
        ? Text(
            text,
            style: TextStyle(
              color: color.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          )
        : ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white, // Placeholder color, not visible due to ShaderMask
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
  }
}