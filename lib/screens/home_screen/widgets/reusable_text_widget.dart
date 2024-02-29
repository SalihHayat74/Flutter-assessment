

import 'dart:ui';
import 'package:flutter/material.dart';

class ReusableTextWidget extends StatelessWidget {
  const ReusableTextWidget({
  required this.text,
  this.color=Colors.black,
  this.fontSize=12,
  this.fontWeight=FontWeight.normal
  ,super.key});
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}
