import 'package:flutter/material.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/form_data.dart';
import 'package:shamo_front/utils/small_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor1,
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigText(
              text: 'Register',
            ),
            const SmallText(
              text: 'Register for New User',
              fontSize: 14,
            ),
            const SizedBox(height: 40),
            const BigText(
              text: 'Full Name',
              fontSize: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            const FormWidget(
              text: 'Your Full Name',
              image: 'assets/images/icon_name.png',
            ),
            const SizedBox(height: 15),
            const BigText(
              text: 'Username',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            const FormWidget(
              text: 'Your Username',
              image: 'assets/images/icon_username.png',
            ),
            const SizedBox(height: 15),
            const BigText(
              text: 'Email Address',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            const FormWidget(
              text: 'Your Email Address',
              image: 'assets/images/icon_email.png',
            ),
            const SizedBox(height: 15),
            const BigText(
              text: 'Password',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            const FormWidget(
              text: 'Your Password',
              image: 'assets/images/icon_password.png',
            ),
            const SizedBox(height: 25),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: SmallText(
                  text: 'Register',
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
              const SmallText(text: 'Already have an account?'),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const SmallText(
                  text: 'Login',
                  textColor: AppColor.primaryColor,
                ),
              )
            ],
          )),
    );
  }
}
