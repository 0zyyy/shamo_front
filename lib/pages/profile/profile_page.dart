import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  user.profilePhotoUrl!,
                  width: 64,
                )),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user.name}',
                        style: primaryTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '@${user.username}',
                        style: secondaryTextStyle,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/button_exit.png',
                    width: 20,
                  ),
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

    Widget content() {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header(), content()],
    );
  }
}
