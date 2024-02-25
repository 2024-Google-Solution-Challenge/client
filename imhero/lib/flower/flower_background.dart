import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class FlowerBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return Container(
      color: INPUT_BG_COLOR,
      child: Column(
        children: [
          SizedBox(height: app_height * 0.35),
          Image.asset(
            'assets/img/shelf.png',
            width: app_width,
            fit: BoxFit.fill,
          ),
          SizedBox(height: app_height * 0.21),
          Image.asset(
            'assets/img/shelf.png',
            width: app_width,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
