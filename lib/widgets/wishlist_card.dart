import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/product_model.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/wishlist_provider.dart';

class WishlistCard extends StatelessWidget {
  final Product product;
  const WishlistCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries![0].url!,
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!,
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
              Text(
                product.category!.name!,
                style: secondaryTextStyle,
              )
            ],
          )),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/images/button_wishlist_blue.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
