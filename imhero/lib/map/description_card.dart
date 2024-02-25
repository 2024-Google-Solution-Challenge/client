import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class DescriptionCard extends StatefulWidget {
  final String title;
  final String description;
  final int contrib;
  final int card;

  const DescriptionCard({
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          // Description
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          // Contrib
          Row(
            children: [
              Text(
                'Contributors: ${widget.contrib}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle join button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
                ),
                child: const Text('Join'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
