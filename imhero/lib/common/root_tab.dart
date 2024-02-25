import 'package:flutter/widgets.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/layout.dart';
import 'package:imhero/common/style.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: BODY_TITLE_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'My Flower',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Challenge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Talk',
          ),
        ].map((item) {
          return BottomNavigationBarItem(
            icon: Stack(
              children: [
                if (item.label == 'My Flower' && index == 0 ||
                    item.label == 'Challenge' && index == 1 ||
                    item.label == 'Map' && index == 2 ||
                    item.label == 'Talk' && index == 3)
                  bottomNavigationCircle(),
                item.icon,
              ],
            ),
            label: item.label,
          );
        }).toList(),
      ),
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
