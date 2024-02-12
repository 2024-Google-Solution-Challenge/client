import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/flower/flower_grow.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({Key? key}) : super(key: key);

  @override
  _FlowerScreenState createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

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
                app_width * 0.07, 0, app_width * 0.07, app_height * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                SizedBox(height: app_height * 0.05), // 두 Row 사이 간격 조정
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f3.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      ),
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f1.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      ),
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f1.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: app_height * 0.015,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f1.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      ),
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f1.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      ),
                      FlowerGrow(
                        water: 'assets/img/waterpink.png',
                        image1: 'assets/img/f1.png',
                        image2: 'assets/img/f2.png',
                        image3: 'assets/img/f3.png',
                        image4: 'assets/img/f4.png',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: app_height * 0.3,
        // ),
        // SizedBox(
        //     height: app_height * 0.3,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         FlowerGrow(
        //           water: 'assets/img/waterpink.png',
        //           image1: 'assets/img/f1.png',
        //           image2: 'assets/img/f2.png',
        //           image3: 'assets/img/f3.png',
        //           image4: 'assets/img/f4.png',
        //         ),
        //         FlowerGrow(
        //           water: 'assets/img/waterpink.png',
        //           image1: 'assets/img/f1.png',
        //           image2: 'assets/img/f2.png',
        //           image3: 'assets/img/f3.png',
        //           image4: 'assets/img/f4.png',
        //         ),
        //         FlowerGrow(
        //           water: 'assets/img/waterpink.png',
        //           image1: 'assets/img/f1.png',
        //           image2: 'assets/img/f2.png',
        //           image3: 'assets/img/f3.png',
        //           image4: 'assets/img/f4.png',
        //         )
        //       ],
        //     )),
        DraggableScrollableSheet(
          key: _sheet,
          initialChildSize: 0.06,
          maxChildSize: 0.8,
          minChildSize: 0.06,
          expand: true,
          snap: true,
          snapSizes: const [0.5],
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, // 그림자의 색 및 투명도 조절
                    spreadRadius: 0.8,
                    blurRadius: 10,
                    offset: Offset(0, 3), // 그림자의 위치 조절
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, 15, 0, 30), // 위쪽에 8픽셀의 패딩 추가
                      child: FractionallySizedBox(
                        widthFactor: 0.12, // 화면 너비의 절반 크기로 설정
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // 원하는 둥근 모서리 반지름 값 설정
                          child: Container(
                            height: 6,
                            color: PRIMARY_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList.list(
                    children: const [
                      Text('Content'),
                    ],
                  ),
                ],
              ),
            );
          },
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
          SizedBox(height: app_height * 0.33),
          Image.asset('assets/img/shelf.png'),
          SizedBox(height: app_height * 0.20),
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
