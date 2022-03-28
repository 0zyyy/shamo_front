import 'package:flutter/material.dart';
import 'package:shamo_front/pages/cart/cart_page.dart';
import 'package:shamo_front/pages/home/home_page.dart';
import 'package:shamo_front/pages/login/login_page.dart';
import 'package:shamo_front/pages/main/main_page.dart';
import 'package:shamo_front/pages/popular_product_page.dart';
import 'package:shamo_front/pages/product_pages.dart';
import 'package:shamo_front/pages/profile/edit_profile.dart';
import 'package:shamo_front/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MainPage(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/home': (context) => LoginPage(),
        '/cart': (context) => CartPage(),
        '/edit-profile': (context) => EditProfilePage(),
        // '/product': (context) => ProductDetailPage(),
        '/product': (context) => PopularProductPage()
      },
    );
  }
}
