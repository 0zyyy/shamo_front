import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/small_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
          width: 215,
          height: 278,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Color(0xFFECEDEF),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image(
                image: AssetImage('assets/images/image_shoes.png'),
                fit: BoxFit.cover,
                height: 150,
                width: 215,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hiking',
                      style: secondaryTextStyle,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'COURT VISION 2.0',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '\$ 58.67',
                      style: priceTextStyle,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
