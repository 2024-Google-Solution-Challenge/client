import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import "package:imhero/common/dotted_line.dart";
import "package:imhero/common/colors.dart";
import "package:imhero/common/style.dart";

import 'package:imhero/challenge/gage_bar.dart';
import 'package:imhero/challenge/status_graph.dart';
import "package:imhero/challenge/challenge_card.dart";

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int level = 6;
  int maxLevel = 10;
  bool toggle = true;

  final TodayCardList = [
    {
      "title": "Mastering Recycling",
      "description":
          "Join us in the quest to perfect your recy\ncling habits and minimize waste.",
      "isChecked": false,
    },
    {
      "title": "Tumbler Triumph",
      "description":
          "Take the plunge into sustainable living \nby ditching single-use plastics.",
      "isChecked": false,
    },
  ];

  final TogetherCardList = [
    {
      "title": "Green Plugging!",
      "description":
          "Join us for eco-friendly activities like \nrecycling and volunteering.",
      "isChecked": false,
    },
    {
      "title": "Green Volunteer!",
      "description":
          "Join us in volunteering for a better co\nmmunity and planet!!",
      "isChecked": false,
    },
    {
      "title": "Unite for Eco-Actions!",
      "description":
          "Come together for environmental initi\natives like tree planting.",
      "isChecked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "One-day goal challenge",
              style: underLineTextStyle(),
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
                ? GageBar(level, maxLevel, appWidth - 40).build()
                : const StatusGraph(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedLine(
                width: appWidth - 40 - 80,
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
          SizedBox(
            width: double.infinity,
            child: Text(
              "Today’s Challenge",
              style: underLineTextStyle(),
            ),
          ),
          Column(
            children: TodayCardList.map((e) => ChallengeCard(
                  title: e["title"].toString(),
                  description: e["description"].toString(),
                  isChecked: e["isChecked"] as bool,
                )).toList(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Together Challenge",
              style: underLineTextStyle(),
            ),
          ),
          Column(
            children: TogetherCardList.map((e) => ChallengeCard(
                  title: e["title"].toString(),
                  description: e["description"].toString(),
                  isChecked: e["isChecked"] as bool,
                )).toList(),
          ),
        ],
      ),
    ));
  }
}
