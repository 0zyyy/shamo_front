import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor1,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_headset.png',
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Oops no message yet',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 152,
              height: 44,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
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

  Widget content() {
    return Expanded(
      child: Container(
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.only(left: 30, top: 33, right: 30),
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/image_shop_logo.png',
                    width: 54,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shoe Store',
                          style: primaryTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Good night, This item is only available in size 42 and 43',
                          style: secondaryTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Now',
                    style: secondaryTextStyle,
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                height: 1,
                color: subtitleColor,
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor3,
        body: Column(
          children: [header(), content()],
        ));
  }
}
