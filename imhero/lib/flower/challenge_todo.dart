import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String? todo_title;
  final String? todo_content;

  const Todo({
    this.todo_title,
    this.todo_content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return Container(
      width: app_width * 0.9, // 원하는 너비로 설정
      height: app_height * 0.1, // 원하는 높이로 설정
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // 테두리의 모서리를 둥글게 만듭니다.
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // 그림자 색상
            spreadRadius: 2, // 그림자가 얼마나 퍼지는지를 결정합니다.
            blurRadius: 4, // 그림자의 흐릿한 정도
            offset: const Offset(0, 1), // 그림자의 위치 조절
          ),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(app_width * 0.05, 10, app_width * 0.05, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo_title ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              todo_content ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
