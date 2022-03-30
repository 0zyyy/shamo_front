import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/pages/cart/cart_page.dart';
import 'package:shamo_front/pages/cart/checkout_details.dart';
import 'package:shamo_front/pages/cart/checkout_success_page.dart';
import 'package:shamo_front/pages/home/home_page.dart';
import 'package:shamo_front/pages/login/login_page.dart';
import 'package:shamo_front/pages/main/main_page.dart';
import 'package:shamo_front/pages/popular_product_page.dart';
import 'package:shamo_front/pages/product_pages.dart';
import 'package:shamo_front/pages/profile/edit_profile.dart';
import 'package:shamo_front/pages/register/register_page.dart';
import 'package:shamo_front/pages/splash/splash_page.dart';
import 'package:shamo_front/provider/auth_provider.dart';
import 'package:shamo_front/provider/cart_provider.dart';
import 'package:shamo_front/provider/product_provider.dart';
import 'package:shamo_front/provider/wishlist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => MainPage(),
          '/cart': (context) => CartPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/checkout': (context) => CheckOutDetails(),
          '/checkout-success': (context) => CheckOutSuccessPage(),
        },
      ),
    );
  }
}
