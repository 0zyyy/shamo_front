import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/provider/cart_provider.dart';
import 'package:shamo_front/widgets/cart_card.dart';

import '../theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    // print(cartProvider.carts[0].product);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget emptyPage() {
      return Container(
        color: backgroundColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Oops your cart is empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shous',
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 152,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        children:
            cartProvider.carts.map((cart) => CartCard(cart: cart)).toList(),
      );
    }

    Widget customBottomNav() {
      return cartProvider.carts.isEmpty
          ? Container(
              height: 165,
            )
          : Container(
              height: 165,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: defaultMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: primaryTextStyle,
                        ),
                        Text(
                          '\$' + cartProvider.totalPrice().toString(),
                          style: priceTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue to Checkout',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semiBold),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: primaryTextColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: cartProvider.carts.isEmpty ? emptyPage() : content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
