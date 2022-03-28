import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class CheckOutSuccessPage extends StatelessWidget {
  const CheckOutSuccessPage({Key? key}) : super(key: key);

  PreferredSizeWidget header() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor1,
      title: Text(
        'Checkout Success!',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
    );
  }

  Widget content(BuildContext context) {
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
            'You made a transaction',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Stay at home where we prepare your dream shoes',
            style: subtitleTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 196,
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
                'Order Other Shoes',
                style: primaryTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 196,
            height: 44,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF39374B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'View My Order',
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: content(context),
    );
  }
}
