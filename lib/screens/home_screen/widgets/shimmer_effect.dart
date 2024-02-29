

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
  this.height=30,
  this.width=200
  ,super.key});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20)
          ),

        ), gradient: LinearGradient(colors: [
          Colors.grey[300]!,
      Colors.white
    ]));
  }
}
