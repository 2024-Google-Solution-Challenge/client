import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imhero/common/colors.dart';

class DescriptionCard extends StatefulWidget {
  final String title;
  final String description;
  final int contrib;
  final int card;

  DescriptionCard({
    Key? key,
    required this.title,
    required this.description,
    required this.contrib,
    required this.card,
  }) : super(key: key);

  @override
  State<DescriptionCard> createState() => _DescripCardState();
}

class _DescripCardState extends State<DescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          // Description
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Contrib
          Row(
            children: [
              Text(
                'Contributors: ${widget.contrib}',
                style: TextStyle(fontSize: 16.0),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle join button press
                },
                child: Text('Join'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
                ),
              ),
            ],
          ),
        ],
      ),
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(6),
      //   border: Border(
      //     bottom: BorderSide(
      //       color: PRIMARY_COLOR, // 테두리 색상
      //       width: 2.0, // 테두리 너비
      //     ),
      //   ),
      // ),
      // child: Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Expanded(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 widget.title,
      //                 style: const TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                   color: BODY_TITLE_COLOR,
      //                 ),
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //               Text(
      //                 widget.description,
      //                 style: const TextStyle(
      //                   fontSize: 12,
      //                   color: BODY_TEXT_COLOR,
      //                 ),
      //                 overflow: TextOverflow.ellipsis,
      //                 maxLines: 4,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
