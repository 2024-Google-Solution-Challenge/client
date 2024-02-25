import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imhero/common/colors.dart';

class TogetherCard extends StatefulWidget {
  final String title;
  final String description;
  const TogetherCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<TogetherCard> createState() => _TogetherCardState();
}

class _TogetherCardState extends State<TogetherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: const Border(
          bottom: BorderSide(
            color: PRIMARY_COLOR, // 테두리 색상
            width: 2.0, // 테두리 너비
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: BODY_TITLE_COLOR,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: BODY_TEXT_COLOR,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
