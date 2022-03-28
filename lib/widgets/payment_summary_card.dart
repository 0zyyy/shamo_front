import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class PaymenySummaryCard extends StatelessWidget {
  const PaymenySummaryCard({Key? key}) : super(key: key);
  Widget paymentText(String textDetail, String textQuantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textDetail,
          style: secondaryTextStyle,
        ),
        Text(
          textQuantity,
          style: primaryTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: defaultMargin),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: primaryTextStyle.copyWith(fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          paymentText('Product Quantity', '2 Items'),
          SizedBox(
            height: 12,
          ),
          paymentText('Product Quantity', '2 Items'),
          SizedBox(
            height: 12,
          ),
          paymentText('Product Quantity', '2 Items'),
          Divider(thickness: 1, color: subtitleColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: priceTextStyle,
              ),
              Text(
                'Harga',
                style: priceTextStyle.copyWith(fontWeight: medium),
              )
            ],
          )
        ],
      ),
    );
  }
}
