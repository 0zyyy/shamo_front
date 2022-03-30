import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/auth_provider.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/form_data.dart';
import 'package:shamo_front/utils/small_text.dart';
import 'package:shamo_front/widgets/loading_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal registrasi',
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
            Text(
              'Full Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            FormWidget(
              text: 'Your Full Name',
              image: 'assets/images/icon_name.png',
              controller: nameController,
            ),
            const SizedBox(height: 15),
            Text(
              'Username',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            FormWidget(
              text: 'Your Username',
              image: 'assets/images/icon_username.png',
              controller: usernameController,
            ),
            const SizedBox(height: 15),
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            FormWidget(
              text: 'Your Email Address',
              image: 'assets/images/icon_email.png',
              controller: emailController,
            ),
            const SizedBox(height: 15),
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            FormWidget(
              text: 'Your Password',
              image: 'assets/images/icon_password.png',
              controller: passwordController,
              obsecureText: true,
            ),
            const SizedBox(height: 15),
            isLoading
                ? LoadingButton()
                : Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    child: TextButton(
                      onPressed: handleSignUp,
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
                  Navigator.pop(context);
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
