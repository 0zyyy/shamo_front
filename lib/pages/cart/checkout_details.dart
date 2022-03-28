import 'package:flutter/material.dart';
import 'package:shamo_front/widgets/address_details_card.dart';
import 'package:shamo_front/widgets/checkout_cart_details.dart';
import 'package:shamo_front/widgets/payment_summary_card.dart';

import '../theme.dart';

class CheckOutDetails extends StatelessWidget {
  const CheckOutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        leading: Icon(Icons.chevron_left),
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        // margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Items',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            CartProductDetailsCard(),
            CartProductDetailsCard(),
            AddressDetailsCard(),
            PaymenySummaryCard()
          ],
        ),
      );
    }

    Widget customNavbar() {
      return Container(
          // height: 165,
          // height: 50,
          padding: EdgeInsets.all(defaultMargin),
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout-success');
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Checkout Now',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )),
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: ListView(children: [content()]),
      bottomNavigationBar: customNavbar(),
    );
  }
}
