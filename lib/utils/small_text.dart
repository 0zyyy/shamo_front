import 'package:flutter/material.dart';
import 'package:shamo_front/utils/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  const SmallText({
    Key? key,
    required this.text,
    this.textColor = const Color(0xFF504F5E),
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins'),
    );
  }
}
