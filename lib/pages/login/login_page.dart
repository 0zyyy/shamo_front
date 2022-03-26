import 'package:flutter/material.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/form_data.dart';
import 'package:shamo_front/utils/small_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor1,
      body: Container(
        margin: const EdgeInsets.only(top: 80, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigText(
              text: 'Login',
            ),
            const SmallText(text: 'Sign In to Countinue'),
            const SizedBox(height: 40),
            const BigText(
              text: 'Email Address',
              fontSize: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            const FormWidget(
              text: 'Your Email Address',
              image: 'assets/images/icon_email.png',
            ),
            const SizedBox(height: 35),
            const BigText(
              text: 'Password',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            const FormWidget(
              text: 'Your Password',
              image: 'assets/images/icon_password.png',
            ),
            const SizedBox(height: 35),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: SmallText(
                  text: 'Login',
                  textColor: AppColor.primaryTextColor,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const SmallText(text: 'Don\'t have an account?'),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const SmallText(
                  text: 'Sign Up',
                  textColor: AppColor.primaryColor,
                ),
              )
            ],
          )),
    );
  }
}
