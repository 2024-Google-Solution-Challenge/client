import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/flower/challenge_todo.dart';
import 'package:imhero/flower/flower_grow.dart';
import 'package:imhero/flower/get_flower.dart';
import 'package:imhero/flower/flower_background.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routemaster/routemaster.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({Key? key}) : super(key: key);

  @override
  _FlowerScreenState createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  Map<String, dynamic> userData = {};
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext con, AsyncSnapshot<User?> user) {
        if (!user.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Firebase App"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Welcome to Firebase App"),
                  ElevatedButton(
                    onPressed: () {
                      // /login으로 이동하는 버튼
                      Routemaster.of(context).push('/login');
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // /join으로 이동하는 버튼
                      Routemaster.of(context).push('/signup');
                    },
                    child: const Text('Signup'),
                  ),
                ],
              ),
            ),
          );
        } else {
          final String userId = FirebaseAuth.instance.currentUser!.uid;
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
                              count:
                                  '${userData['user_flower_counts']?['flower1'] ?? "0"}',
                            ),
                            GetFlowerForm(
                              image: 'assets/img/skyblueflower.png',
                              count:
                                  '${userData['user_flower_counts']?['flower2'] ?? "0"}',
                            ),
                            GetFlowerForm(
                              image: 'assets/img/yellowflower.png',
                              count:
                                  '${userData['user_flower_counts']?['flower3'] ?? "0"}',
                            ),
                            GetFlowerForm(
                              image: 'assets/img/whiteflower.png',
                              count:
                                  '${userData['user_flower_counts']?['flower4'] ?? "0"}',
                            ),
                            GetFlowerForm(
                              image: 'assets/img/purpleflower.png',
                              count:
                                  '${userData['user_flower_counts']?['flower5'] ?? "0"}',
                            ),
                            GetFlowerForm(
                              image: 'assets/img/blueflower.png',
                              count:
                                  '${userData['user_flower_counts']?['flower6'] ?? "0"}',
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
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop1'] ??
                                  0,
                            ),
                            FlowerGrow(
                              water: 'assets/img/waterpink.png',
                              image1: 'assets/img/f1.png',
                              image2: 'assets/img/f2.png',
                              image3: 'assets/img/f3.png',
                              image4: 'assets/img/f4.png',
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop2'] ??
                                  0,
                            ),
                            FlowerGrow(
                              water: 'assets/img/waterpink.png',
                              image1: 'assets/img/f1.png',
                              image2: 'assets/img/f2.png',
                              image3: 'assets/img/f3.png',
                              image4: 'assets/img/f4.png',
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop3'] ??
                                  0,
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
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop4'] ??
                                  0,
                            ),
                            FlowerGrow(
                              water: 'assets/img/waterpink.png',
                              image1: 'assets/img/f1.png',
                              image2: 'assets/img/f2.png',
                              image3: 'assets/img/f3.png',
                              image4: 'assets/img/f4.png',
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop5'] ??
                                  0,
                            ),
                            FlowerGrow(
                              water: 'assets/img/waterpink.png',
                              image1: 'assets/img/f1.png',
                              image2: 'assets/img/f2.png',
                              image3: 'assets/img/f3.png',
                              image4: 'assets/img/f4.png',
                              countwater: userData['user_waterdrop_counts']
                                      ?['waterdrop6'] ??
                                  0,
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
                builder:
                    (BuildContext context, ScrollController scrollController) {
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
                            padding: const EdgeInsets.fromLTRB(
                                0, 15, 0, 30), // 위쪽에 8픽셀의 패딩 추가
                            child: FractionallySizedBox(
                              widthFactor: 0.12, // 화면 너비의 절반 크기로 설정
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // 원하는 둥근 모서리 반지름 값 설정
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
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
      },
    );
  }
}
