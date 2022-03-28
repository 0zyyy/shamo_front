import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 110,
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_shoes.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Terrex Urban Law',
                          style: primaryTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          'Harga',
                          style: priceTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/button_add.png',
                          width: 15,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '2',
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/button_min.png',
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/icon_remove.png',
                width: 10,
                height: 12,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
