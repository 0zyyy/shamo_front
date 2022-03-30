import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/pages/chat/chat_page.dart';
import 'package:shamo_front/pages/home/home_page.dart';
import 'package:shamo_front/pages/profile/edit_profile.dart';
import 'package:shamo_front/pages/profile/profile_page.dart';
import 'package:shamo_front/pages/wishlist/wishlist_page.dart';
import 'package:shamo_front/provider/auth_provider.dart';
import 'package:shamo_front/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _CartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: AppColor.secondaryColor,
        child: Image.asset(
          'assets/images/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          // return HomePage();
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishListPage();
          break;
        case 3:
          return ProfilePage();
          // return EditProfilePage();
          break;
        default:
          return HomePage();
          break;
      }
    }

    Widget _CustomBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          color: AppColor.bgNavBar,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              backgroundColor: AppColor.bgNavBar,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  // print(value);
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/images/icon_home.png',
                        width: 21,
                        color: currentIndex == 0
                            ? AppColor.primaryColor
                            : AppColor.bgUnselected,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/images/icon_chat.png',
                        width: 21,
                        color: currentIndex == 1
                            ? AppColor.primaryColor
                            : AppColor.bgUnselected,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/images/icon_wishlist.png',
                        width: 21,
                        color: currentIndex == 2
                            ? AppColor.primaryColor
                            : AppColor.bgUnselected,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/images/icon_profile.png',
                        width: 21,
                        color: currentIndex == 3
                            ? AppColor.primaryColor
                            : AppColor.bgUnselected,
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.bgColor1,
      floatingActionButton: _CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _CustomBottomNav(),
      body: Center(child: body()),
    );
  }
}
