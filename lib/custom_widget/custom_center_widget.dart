import 'package:flutter/material.dart';

class CustomCenter extends StatelessWidget {
  CustomCenter({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
