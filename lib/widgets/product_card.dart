import 'package:flutter/material.dart';
import 'package:shamo_front/models/category_model.dart';
import 'package:shamo_front/models/product_model.dart';
import 'package:shamo_front/pages/popular_product_page.dart';
import 'package:shamo_front/pages/product_pages.dart';
import 'package:shamo_front/pages/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopularProductPage(product: product),
            ));
      },
      child: Container(
          width: 215,
          height: 278,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Color(0xFFECEDEF),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image(
                image: NetworkImage(product.galleries![0].url!),
                fit: BoxFit.cover,
                height: 150,
                width: 215,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category!.name.toString(),
                      style: secondaryTextStyle,
                    ),
                    SizedBox(height: 6),
                    Text(
                      product.name!,
                      style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: semiBold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
