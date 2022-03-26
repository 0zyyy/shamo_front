import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                  child: Image.asset(
                'assets/images/image_profile.png',
                width: 64,
              )),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, Alex jembalikan kuntul-kuntulan',
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '@jaluiman',
                      style: secondaryTextStyle,
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/images/button_exit.png',
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String text) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: secondaryTextStyle,
          ),
          Icon(
            Icons.chevron_right,
            color: secondaryTextColor,
          )
        ],
      ),
    );
  }

  Widget content(context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(color: backgroundColor3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Account',
            style:
                primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem('Edit Profile')),
          menuItem('Your Orders'),
          menuItem('Help'),
          SizedBox(
            height: 20,
          ),
          Text(
            'General',
            style:
                primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          menuItem('Privacy & Policy'),
          menuItem('Term of Service'),
          menuItem('Rate App'),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header(), content(context)],
    );
  }
}
