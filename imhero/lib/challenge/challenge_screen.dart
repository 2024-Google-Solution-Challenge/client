import "package:flutter/material.dart";

import "package:imhero/common/dotted_line.dart";

import 'package:imhero/challenge/gage_bar.dart';
import 'package:imhero/challenge/status_graph.dart';
import "package:imhero/challenge/challenge_list.dart";

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int level = 1;
  int maxLevel = 10;
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("One-day goal challenge"),
          Row(
            children: [
              const Text("You are Hero!"),
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
          toggle ? GageBar(level, maxLevel).build() : const StatusGraph(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedLine(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Colors.grey,
              ),
              Image.asset(
                "assets/img/sprout.png",
                width: 50,
                height: 50,
              ),
            ],
          ),
          const ChallengeList(),
        ],
      ),
    );
  }
}
