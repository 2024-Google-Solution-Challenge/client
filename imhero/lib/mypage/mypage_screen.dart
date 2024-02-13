import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  String _nickname = 'nickname';

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return Container(
      color: BACKGROUND_COLOR,
      child: Padding(
        padding: EdgeInsets.fromLTRB(app_width * 0.05, app_height * 0.2, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MY PAGE',
              style: TextStyle(
                color: Color(0xFFFF7510),
                decoration: TextDecoration.none,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: app_height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
              children: [
                Image.asset(
                  'assets/img/profile.png',
                  width: app_width * 0.55,
                ),
              ],
            ),
            SizedBox(
              height: app_height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
              children: [
                Text(
                  _nickname,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Change Nickname"),
                          content: TextField(
                            onChanged: (value) {
                              _nickname = value; // 텍스트가 변경될 때마다 _nickname을 업데이트
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // 팝업 닫기
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // 저장 버튼을 눌렀을 때 실행할 작업
                                setState(() {
                                  // 텍스트를 변경된 값으로 업데이트
                                  // 이때, 원래 텍스트를 변경된 텍스트로 교체하는 작업을 수행
                                  _nickname = _nickname;
                                });
                                Navigator.of(context).pop(); // 팝업 닫기
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.edit_square), // 아이콘은 수정 아이콘으로 설정됨
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
