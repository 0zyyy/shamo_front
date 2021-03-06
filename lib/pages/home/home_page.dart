import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/product_model.dart';
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/pages/login/body_page.dart';
import 'package:shamo_front/provider/auth_provider.dart';
import 'package:shamo_front/provider/product_provider.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/colors.dart';
import 'package:shamo_front/utils/small_text.dart';
import 'package:shamo_front/widgets/product_card.dart';
import 'package:shamo_front/widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    User user = authProvider.user;
    // print(productProvider.products);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Hello, ' + user.name!,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5),
                  SmallText(
                    text: '@' + user.username!,
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl!))),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            SizedBox(
              width: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('All Shoes',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.bgColor2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Running',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.bgColor2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Training',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.bgColor2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Basketball',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.bgColor2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Hiking',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
          ]),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(top: 39, left: 30),
        child: BigText(text: 'Popular Products'),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(
                          product: product,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(top: 39, left: 30),
        child: BigText(text: 'New Arrivals'),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product: product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals()
      ],
    );
  }
}
