import 'package:flutter/material.dart';
import 'package:shamo_front/utils/big_text.dart';
import 'package:shamo_front/utils/small_text.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({Key? key}) : super(key: key);

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  Widget _buildPageItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 300,
            color: Colors.redAccent,
            width: double.maxFinite,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
