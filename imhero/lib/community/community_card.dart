import 'package:flutter/material.dart';

class CommunityCard extends StatefulWidget {
  final String profile;
  final String accountName;
  final String content;
  final int heart;
  final int reply;
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
                    iconCount(
                      Icons.favorite_outline,
                      widget.heart,
                      () {
                        setState(() {
                          widget.isHearted = !widget.isHearted;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    iconCount(Icons.message_outlined, widget.reply, () {}),
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

Widget iconCount(
  IconData icon,
  int count,
  void Function()? onPressed,
) {
  return Row(
    children: [
      IconButton(icon: Icon(icon), onPressed: onPressed),
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
