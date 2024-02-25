import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class GetFlowerForm extends StatelessWidget {
  final String? count;
  final String? image;

  const GetFlowerForm({
    this.count,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    final baseBorder = BoxDecoration(
      border: Border.all(
        color: const Color(0xFFD3B592),
        width: 3.0,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    return Container(
      height: app_height * 0.1,
      width: app_width * 0.1,
      decoration: baseBorder,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image!),
          const SizedBox(height: 10),
          Text(
            count.toString(),
            style: const TextStyle(
              color: TEXT_COLOR,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
