import 'package:flutter/material.dart';
import 'package:shamo_front/pages/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
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
                    image: AssetImage('assets/images/image_profile.png'))),
          ),
          nameInput('Name', 'Jembalikan'),
          nameInput('Username', '@jaluiman'),
          nameInput('Email Address', 'jalu@iman.com'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor3,
        body: Column(children: [header(), content()]));
  }
}
