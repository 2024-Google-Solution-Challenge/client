import 'package:flutter/material.dart';

class GageBar {
  final int level;
  final int maxLevel;
  final double app_width;

  GageBar(this.level, this.maxLevel, this.app_width);

  Widget build() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
            width: app_width,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffd8efd4), Color(0xffecfdfb)],
                ))),
        Container(
          width: ((level / maxLevel) * 0.9 + 0.1) * app_width - 18,
          height: 62,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xffff8832), Color(0xffc7dbca)],
            ),
            borderRadius: BorderRadius.circular(31),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 120, 120).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.all(9),
        ),
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 120, 120).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: EdgeInsets.only(
            left: ((level / maxLevel) * 0.9 + 0.1) * app_width - 44 - 18,
            top: 18,
            bottom: 18,
          ),
          child: Text(
            level.toString(),
            style: const TextStyle(
                fontSize: 25,
                color: Color(0xffff8832),
                fontWeight: FontWeight.w700,
                textBaseline: TextBaseline.alphabetic),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
