import 'package:flutter/material.dart';

import 'package:imhero/common/style.dart';
import 'package:imhero/common/colors.dart';

ElevatedButton floatingButton(String text, void Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: HIGHLIGHT_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(text, style: const TextStyle(color: HIGHLIGHT_COLOR)),
  );
}

BottomNavigationBar bottomNavigationBar(TabController controller, int index) {
  return BottomNavigationBar(
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
  );
}
