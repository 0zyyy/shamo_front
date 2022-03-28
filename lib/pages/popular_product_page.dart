import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/utils/dimensions.dart';

class PopularProductPage extends StatefulWidget {
  const PopularProductPage({Key? key}) : super(key: key);

  @override
  State<PopularProductPage> createState() => _PopularProductPageState();
}

class _PopularProductPageState extends State<PopularProductPage> {
  int currentIndex = 0;
  bool isWishList = false;
  List images = [
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
  ];
  List familiarShoes = [
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessMsg() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/icon_success.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Hurray',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Item added berhasil',
                          style: secondaryTextStyle,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: 20,
                            ),
                            width: 154,
                            height: 54,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    backgroundColor: primaryColor),
                                onPressed: () {},
                                child: Text(
                                  'View my Cart',
                                  style: primaryTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                )))
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget bottomBar() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('assets/images/button_chat.png'))),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 54,
                child: TextButton(
                  onPressed: () {
                    showSuccessMsg();
                  },
                  style: TextButton.styleFrom(
                      primary: primaryColor,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    'Add to Cart',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                currentIndex == index ? primaryColor : const Color(0xFFC4C4C4)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 310,
            child: CarouselSlider(
                items: images
                    .map((e) => Image.asset(
                          e,
                          width: MediaQuery.of(context).size.width,
                          height: 310,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                      // print('index skrg ' + currentIndex.toString());
                    });
                  },
                )),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                // int indexSui = images.indexOf(e);
                // print(indexSui);
                index++;
                // print(index);
                return indicator(index);
                // print('indicator index ' + index.toString());
                // return indicator(index);
              }).toList()),
        ],
      );
    }

    Widget familiarShoesCard(String imgUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: AssetImage(imgUrl))),
      );
    }

    Widget content() {
      int indexFamiliar = -1;
      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // Note: nama dan kategori sepatu
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX JUMBALANG',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          'Hiking',
                          style: subtitleTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishList = !isWishList;
                      });
                      if (isWishList) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Added to your wishlist',
                              textAlign: TextAlign.center,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Removed from your wishlist',
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    child: Image.asset(
                      isWishList
                          ? 'assets/images/button_wishlist_blue.png'
                          : 'assets/images/button_wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            // Note: price start from
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              decoration: BoxDecoration(color: backgroundColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Start from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Harga',
                    style: priceTextStyle.copyWith(
                        fontSize: 15, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            // Note : description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG JEMBALNG',
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            ),
            //Note: familiar shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        'Familiar Shoes',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: familiarShoes.map((image) {
                          indexFamiliar++;
                          return Container(
                              margin: EdgeInsets.only(
                                  left: indexFamiliar == 0 ? defaultMargin : 0),
                              child: familiarShoesCard(image));
                        }).toList(),
                      ),
                    )
                  ]),
            ),
            bottomBar()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: Stack(
        children: [
          // CAROUSEL SLIDER
          Positioned(child: header()),
          // ICON KANAN KIRI
          Positioned(
              top: 45,
              left: defaultMargin,
              right: defaultMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.chevron_left)),
                  Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  )
                ],
              )),
          // CONTAINER BAWAH
          Positioned(
            top: 310,
            left: 0,
            right: 0,
            bottom: 0,
            child: content(),
          )
        ],
      ),
    );
  }
}
