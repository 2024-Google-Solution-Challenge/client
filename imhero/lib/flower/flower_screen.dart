import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/flower/challenge_todo.dart';
import 'package:imhero/flower/flower_grow.dart';
import 'package:imhero/flower/get_flower.dart';
import 'package:imhero/flower/flower_background.dart';

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
                color: Color(0xFFF9F9F9),
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          app_width * 0.05, 0, app_width * 0.05, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '오늘 남은 Challenge',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 15),
                          Todo(
                            todo_title: 'first',
                            todo_content: '일회용품 사용 줄이기',
                          ),
                          SizedBox(height: 10),
                          Todo(
                            todo_title: 'second',
                            todo_content: '재활용 하기',
                          ),
                          SizedBox(height: 10),
                          Todo(
                            todo_title: 'third',
                            todo_content: '플로깅 하기',
                          ),
                          SizedBox(height: 10),
                          Todo(
                            todo_title: 'forth',
                            todo_content: '텀블러 사용하기',
                          ),
                        ],
                      ),
                    ),
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
