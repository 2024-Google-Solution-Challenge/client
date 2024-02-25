import "package:flutter/material.dart";

import "package:imhero/common/dotted_line.dart";
import "package:imhero/common/colors.dart";

import 'package:imhero/challenge/gage_bar.dart';
import 'package:imhero/challenge/status_graph.dart';
import "package:imhero/challenge/challenge_list.dart";

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int level = 6;
  int maxLevel = 10;
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: app_width,
            child: const Text(
              "One-day goal challenge",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: BODY_TITLE_COLOR,
                decoration: TextDecoration.underline,
                decorationColor: HIGHLIGHT_COLOR,
                decorationThickness: 5,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "You are Hero!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: TITLE_TEXT_COLOR,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
                icon:
                    Icon(toggle ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: toggle
                ? GageBar(level, maxLevel, app_width - 40).build()
                : const StatusGraph(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedLine(
                width: app_width - 40 - 80,
                height: 1,
                color: Colors.grey,
              ),
              Image.asset(
                "assets/img/sprout.png",
                width: 80,
                height: 80,
              ),
            ],
          ),
          ChallengeList(),
        ],
      ),
    ));
  }
}
