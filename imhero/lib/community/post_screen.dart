import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

Widget postScreen(Widget addPostButton, Widget cancelButton) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 162, 162, 162).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/profile.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    // text color

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: INPUT_BORDER_COLOR,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: INPUT_BORDER_COLOR,
                      ),
                    ),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 8.0),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: INPUT_BORDER_COLOR,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: INPUT_BORDER_COLOR,
                      ),
                    ),
                    labelText: 'Content',
                  ),
                  maxLines: 10,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    addPostButton,
                    const SizedBox(width: 8.0),
                    cancelButton,
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
