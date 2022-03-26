import 'package:flutter/material.dart';
import 'package:shamo_front/utils/colors.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const BigText(
      {Key? key,
      required this.text,
      this.textColor = Colors.white,
      this.fontSize = 24,
      this.fontWeight = FontWeight.w600})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppColor.primaryTextStyle,
    );
  }
}
