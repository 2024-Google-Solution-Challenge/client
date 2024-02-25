import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class ChallengeCard extends StatefulWidget {
  final String title;
  final String description;
  bool isChecked;
  ChallengeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isChecked});

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.isChecked ? null : Colors.white,
        gradient: widget.isChecked
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffd8efd4), Color(0xffecfdfb)],
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 120, 120).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: BODY_TITLE_COLOR,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: BODY_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    value: widget.isChecked,
                    activeColor: Colors.white,
                    checkColor: PRIMARY_COLOR,
                    shape: const CircleBorder(),
                    side: const BorderSide(color: PRIMARY_COLOR, width: 2.0),
                    onChanged: (bool? value) {
                      setState(() {
                        widget.isChecked = value!;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
