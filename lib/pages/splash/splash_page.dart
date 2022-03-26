import 'package:flutter/material.dart';
import 'package:shamo_front/utils/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: Center(
        child: Container(
          width: 150,
          child: Image.asset('assets/image_splash.png'),
        ),
      ),
    );
  }
}
