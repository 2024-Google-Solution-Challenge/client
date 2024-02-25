import 'package:imhero/common/layout.dart';
import 'package:imhero/common/button.dart';

import 'package:imhero/mypage/mypage_screen.dart';
import 'package:imhero/community/community_screen.dart';
import 'package:imhero/flower/flower_screen.dart';
import 'package:imhero/map/map_screen.dart';
import 'package:imhero/challenge/challenge_screen.dart';

import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'home';

  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'IMHERO',
      action: IconButton(
        icon: const Icon(Icons.person_outline),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyPageScreen(),
              ));
        },
      ),
      bottomNavigationBar: bottomNavigationBar(controller, index),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          FlowerScreen(),
          ChallengeScreen(),
          MapScreen(),
          CommunityScreen(),
        ],
      ),
    );
  }
}
