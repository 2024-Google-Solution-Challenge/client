import 'package:flutter/material.dart';

import 'package:imhero/common/button.dart';

class CommunityCard extends StatefulWidget {
  final String profile;
  final String accountName;
  final String content;
  int heart;
  int reply;
  bool isHearted;

  CommunityCard(
      {super.key,
      required this.profile,
      required this.accountName,
      required this.content,
      required this.heart,
      required this.isHearted,
      required this.reply});

  @override
  State<CommunityCard> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 162, 162, 162).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.profile,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.accountName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconCountButton(
                      Icons.favorite_outline,
                      Icons.favorite,
                      widget.heart,
                      () {
                        setState(() {
                          widget.isHearted = !widget.isHearted;
                          if (widget.isHearted) {
                            widget.heart++;
                          } else {
                            widget.heart--;
                          }
                        });
                      },
                      widget.isHearted,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    iconCountButton(
                      Icons.message_outlined,
                      null,
                      widget.reply,
                      () {},
                      false,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.reply_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
