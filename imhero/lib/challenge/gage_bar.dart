import 'package:flutter/material.dart';

class GageBar {
  final int level;
  final int maxLevel;

  GageBar(this.level, this.maxLevel);

  Widget build() {
    return Row(
      children: [
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: 100 * (level / maxLevel),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        Text("$level/$maxLevel"),
      ],
    );
  }
}
