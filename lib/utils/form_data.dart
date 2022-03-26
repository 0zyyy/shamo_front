import 'package:flutter/material.dart';
import 'package:shamo_front/utils/colors.dart';

class FormWidget extends StatelessWidget {
  final String text;
  final String image;
  const FormWidget({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.bgColor2,
              contentPadding: const EdgeInsets.all(20),
              hintText: text,
              prefixIcon: Container(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(image),
                    width: 20,
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
