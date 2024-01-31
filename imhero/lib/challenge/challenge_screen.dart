import "package:flutter/material.dart";

import "package:imhero/challenge/hero_status.dart";
import "package:imhero/challenge/challenge_list.dart";

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeroStatus(),
          Row(
            children: [
              const Divider(
                color: Colors.black,
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
              ),
              Image.asset("assets/img/sprout.png"),
            ],
          ),
          const ChallengeList(),
        ],
      ),
    );
  }
}
