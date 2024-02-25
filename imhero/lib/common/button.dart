import 'package:flutter/material.dart';

import 'package:imhero/common/style.dart';
import 'package:imhero/common/colors.dart';

Widget iconCountButton(
  IconData icon,
  IconData? isClickedIcon,
  int count,
  void Function()? onPressed,
  bool isClicked,
) {
  return Row(
    children: [
      IconButton(
          icon: Icon(isClicked ? isClickedIcon : icon,
              color: isClicked ? Colors.red : Colors.black),
          onPressed: onPressed),
      const SizedBox(
        width: 5,
      ),
      Text(count.toString(), style: const TextStyle(fontSize: 16)),
      const SizedBox(
        width: 20,
      ),
    ],
  );
}

ElevatedButton floatingButton(
    String text, double width, void Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 5,
      fixedSize: Size(width, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: TITLE_TEXT_COLOR,
          width: 2,
        ),
      ),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: TITLE_TEXT_COLOR),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: TITLE_TEXT_COLOR))
        ]),
  );
}

BottomNavigationBar bottomNavigationBar(TabController controller, int index) {
  return BottomNavigationBar(
    selectedItemColor: BODY_TITLE_COLOR,
    unselectedItemColor: BODY_TEXT_COLOR,
    backgroundColor: BACKGROUND_COLOR,
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
          alignment: Alignment.center,
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
