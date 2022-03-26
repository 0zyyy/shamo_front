import 'package:flutter/material.dart';

import '../theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);
  Widget header() {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor1,
      title: Text(
        'Your Cart',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: Container(
        color: backgroundColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_wishlist.png',
              width: 80,
              color: secondaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You don\'t have a favorite shoes',
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
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [header(), body()],
    );
  }
}
