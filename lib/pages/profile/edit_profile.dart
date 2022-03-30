import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/auth_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;
    Widget header(BuildContext context) {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
            color: primaryColor,
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle,
        ),
      );
    }

    Widget nameInput(String name, String hintText) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: secondaryTextStyle,
            ),
            TextField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor))),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.profilePhotoUrl!))),
            ),
            nameInput('Name', '${user.name}'),
            nameInput('Username', '@${user.username}'),
            nameInput('Email Address', '${user.email}'),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        body: Column(children: [header(context), content()]));
  }
}
