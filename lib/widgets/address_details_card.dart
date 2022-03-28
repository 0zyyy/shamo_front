import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class AddressDetailsCard extends StatelessWidget {
  const AddressDetailsCard({Key? key}) : super(key: key);

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
            'Address Details',
            style: primaryTextStyle.copyWith(fontWeight: semiBold),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/icon_store_location.png',
                width: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Location',
                    style: secondaryTextStyle,
                  ),
                  Text(
                    'Adidas Core',
                    style: primaryTextStyle,
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(
              'assets/images/icon_line.png',
              height: 30,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/icon_your_address.png',
                width: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Address',
                    style: secondaryTextStyle,
                  ),
                  Text(
                    'Mars',
                    style: primaryTextStyle,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
