import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({Key? key}) : super(key: key);

  @override
  _FlowerScreenState createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return Stack(
      fit: StackFit.expand,
      children: [
        FlowerBackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.fromLTRB(
                app_width * 0.07, app_height * 0.15, app_width * 0.07, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetFlowerForm(
                  image: 'assets/img/pinkflower.png',
                  count: 2,
                ),
                GetFlowerForm(
                  image: 'assets/img/skyblueflower.png',
                  count: 2,
                ),
                GetFlowerForm(
                  image: 'assets/img/yellowflower.png',
                  count: 2,
                ),
                GetFlowerForm(
                  image: 'assets/img/whiteflower.png',
                  count: 2,
                ),
                GetFlowerForm(
                  image: 'assets/img/purpleflower.png',
                  count: 2,
                ),
                GetFlowerForm(
                  image: 'assets/img/blueflower.png',
                  count: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FlowerBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;

    return Container(
      color: INPUT_BG_COLOR,
      child: Column(
        children: [
          SizedBox(height: app_height * 0.5),
          Image.asset('assets/img/shelf.png'),
          SizedBox(height: app_height * 0.2),
          Image.asset('assets/img/shelf.png'),
        ],
      ),
    );
  }
}

class GetFlowerForm extends StatelessWidget {
  final int? count;
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
        color: Color(0xFFD3B592), // 테두리 색상 설정
        width: 3.0, // 테두리 두께 설정
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
          SizedBox(height: 10), // 이미지와 숫자 사이의 간격 조절
          Text(
            count.toString(), // 숫자 값을 문자열로 변환하여 표시
            style: TextStyle(
              color: TEXT_COLOR,
              fontSize: 12, // 텍스트의 크기 설정
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
