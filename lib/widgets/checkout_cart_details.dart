import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class CartProductDetailsCard extends StatelessWidget {
  const CartProductDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('assets/images/image_shoes.png')))),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrex Low',
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    'Harga',
                    style: priceTextStyle,
                  )
                ],
              ),
              Text(
                '2 items',
                style: secondaryTextStyle,
              )
            ],
          ))
        ],
      ),
    );
  }
}
