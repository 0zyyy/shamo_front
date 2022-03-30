import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/auth_provider.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/form_data.dart';
import 'package:shamo_front/utils/small_text.dart';
import 'package:shamo_front/widgets/loading_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleLogin() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            )));
      }
      setState(() {
        isLoading = false;
      });
    }

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
            FormWidget(
              text: 'Your Email Address',
              image: 'assets/images/icon_email.png',
              controller: emailController,
            ),
            const SizedBox(height: 35),
            const BigText(
              text: 'Password',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            FormWidget(
              text: 'Your Password',
              image: 'assets/images/icon_password.png',
              obsecureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 35),
            GestureDetector(
                onTap: handleLogin,
                child: isLoading
                    ? LoadingButton()
                    : Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 30),
                        child: TextButton(
                          onPressed: handleLogin,
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'Sign Up',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ))
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
