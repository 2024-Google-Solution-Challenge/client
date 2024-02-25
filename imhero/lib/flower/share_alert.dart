import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/button.dart';
import 'dart:math' as math;

AlertDialog shareAlert(BuildContext context, int flowerNum) {
  final List<String> flowerName = [
    'pinkflower.png',
    'blueflower.png',
    'yellowflower.png',
    'whiteflower.png',
    'purpleflower.png',
    'navyflower.png',
  ];
  final List<String> sproutName = [
    'ver5_pink.png',
    'ver5_skyblue.png',
    'ver5_yellow.png',
    'ver5_white.png',
    'ver5_purple.png',
    'blue.png',
  ];
  return AlertDialog(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
        color: PRIMARY_COLOR,
        width: 4,
      ),
    ),
    title: const Text(
      'Share to SNS!',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/${flowerName[flowerNum - 1]}',
          width: 40,
          height: 40,
        ),
        const Text(
          'I grew a flower!',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Image.asset(
          'assets/img/${flowerName[flowerNum - 1]}',
          width: 40,
          height: 40,
        ),
      ],
    ),
    actionsAlignment: MainAxisAlignment.spaceBetween,
    actionsOverflowDirection: VerticalDirection.down,
    actions: <Widget>[
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: VibratingImage(
          imagePath: 'assets/img/${sproutName[flowerNum - 1]}',
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/img/instagram.png')),
            onPressed: () {
              // share to instagram
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/img/facebook.png')),
            onPressed: () {
              // share to facebook
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/img/twitter.png')),
            onPressed: () {
              // share to twitter
            },
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          postButton(
            'Save',
            100,
            false,
            () {
              // add to gallery
            },
          ),
          const SizedBox(
            width: 10,
          ),
          postButton(
            'cancel',
            100,
            true,
            () {
              Navigator.pop(context);
              // add image to gallery
            },
          ),
        ],
      ),
    ],
  );
}

class VibratingImage extends StatefulWidget {
  final String imagePath;

  const VibratingImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _VibratingImageState createState() => _VibratingImageState();
}

class _VibratingImageState extends State<VibratingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 0),
            child: Transform.rotate(
              angle: math.sin(_controller.value * math.pi * 2) * 0.1,
              alignment: Alignment
                  .bottomCenter, // Align the rotation around the bottom axis
              child: child,
            ),
          );
        },
        child: Image.asset(
          widget.imagePath,
        ),
      ),
    );
  }
}
