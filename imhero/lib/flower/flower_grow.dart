import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routemaster/routemaster.dart';

class FlowerGrow extends StatefulWidget {
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? water;
  final int? countwater;
  final Color? colorwater;
  final int? flowernum;

  const FlowerGrow({
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.water,
    this.countwater,
    this.colorwater,
    this.flowernum,
    Key? key,
  }) : super(key: key);

  @override
  _FlowerGrowState createState() => _FlowerGrowState();
}

class _FlowerGrowState extends State<FlowerGrow> {
  int _currentImageIndex = 0;
  late List<String?> _images;
  late int _count; // count 변수 추가

  @override
  void initState() {
    super.initState();
    _images = [
      widget.image1,
      widget.image2,
      widget.image3,
      widget.image4,
      widget.image5
    ];
    _count = widget.countwater ?? 0; // count 값 초기 설정
  }

  void _changeImage() {
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      if (_currentImageIndex == 4) {
        FirebaseFirestore.instance.collection('Users').doc(userId).update({
          'user_flower_counts.flower${widget.flowernum}':
              FieldValue.increment(1),
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [],
              // AlertDialog 내용 추가
            );
          },
        );
      }
      _count--; // count 값을 감소시킴
    });
  }

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: 60,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:
                    _count > 0 ? _changeImage : null, // count 값으로 이미지 활성화 여부 결정
                child: Image.asset(widget.water!),
              ),
              SizedBox(
                height: app_height * 0.2,
                child: Image.asset(_images[_currentImageIndex]!),
              ),
            ],
          ),
          Positioned(
            bottom: app_height * 0.2,
            right: 0,
            child: Container(
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _count > 0
                    ? widget.colorwater //const Color(0xFFFE5C96)
                    : Colors.grey[500], // count 값으로 버튼 색상 결정
              ),
              child: Center(
                child: Text(
                  '$_count', // count 값으로 버튼 텍스트 설정
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
