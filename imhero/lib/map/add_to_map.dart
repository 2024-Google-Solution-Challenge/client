import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/button.dart';
import 'package:imhero/common/style.dart';
import 'package:imhero/common/text_form_field.dart';

Widget addChallengeToMap(
  void Function() onBackButtonPress,
) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackButtonPress,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Add Challenge to Map",
              style: underLineTextStyle(),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Location",
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Title",
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Description",
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "People Number",
                style: TextStyle(
                  fontSize: 15,
                  color: BODY_TITLE_COLOR,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                    ),
                    const Text(
                      "1",
                      style: TextStyle(
                        fontSize: 15,
                        color: BODY_TITLE_COLOR,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          postButton(
            "Add Challenge",
            300,
            false,
            () {},
          )
        ],
      ),
    ),
  );
}
