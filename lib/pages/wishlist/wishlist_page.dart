import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/provider/wishlist_provider.dart';
import 'package:shamo_front/widgets/wishlist_card.dart';

import '../theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        title: Text(
          'Your Wishlist',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget emptyPage() {
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
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
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

    Widget body() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: wishlistProvider.wishlist
                .map((product) => WishlistCard(product: product))
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.isEmpty ? emptyPage() : body()
      ],
    );
  }
}
