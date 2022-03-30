import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_front/models/cart_model.dart';
import 'package:shamo_front/pages/theme.dart';
import 'package:shamo_front/provider/cart_provider.dart';

class CartCard extends StatelessWidget {
  final Cart cart;
  const CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      width: 315,
      height: 110,
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(cart.product!.galleries![0].url!),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.product!.name!,
                          style: primaryTextStyle.copyWith(fontSize: 14),
                          maxLines: 1,
                        ),
                        Text(
                          cart.product!.price!.toString(),
                          style: priceTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartProvider.addQuantity(cart.id!);
                          },
                          child: Image.asset(
                            'assets/images/button_add.png',
                            width: 15,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          cart.quantity.toString(),
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            cartProvider.decreaseQuantity(cart.id!);
                          },
                          child: Image.asset(
                            'assets/images/button_min.png',
                            width: 15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/icon_remove.png',
                  width: 10,
                  height: 12,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
