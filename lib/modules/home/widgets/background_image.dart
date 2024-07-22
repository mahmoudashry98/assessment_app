// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final double? bottom;
  const BackgroundImage({
    Key? key,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom ?? -80,
      child: Image.asset('assets/images/Rectangle 474.png'),
    );
  }
}
