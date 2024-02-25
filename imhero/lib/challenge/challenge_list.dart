import 'package:flutter/material.dart';

class ChallengeList extends StatefulWidget {
  @override
  State<ChallengeList> createState() => _ChallengeListState();
}

class _ChallengeListState extends State<ChallengeList> {
  final CardList = [
    {
      "title": "Challenge 1",
      "description": "Description 1",
      "isChecked": false,
    },
    {
      "title": "Challenge 2",
      "description": "Description 2",
      "isChecked": false,
    },
    {
      "title": "Challenge 3",
      "description": "Description 3",
      "isChecked": false,
    },
    {
      "title": "Challenge 4",
      "description": "Description 4",
      "isChecked": false,
    },
    {
      "title": "Challenge 5",
      "description": "Description 5",
      "isChecked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: ListView.builder(
        itemCount: CardList.length,
        itemBuilder: (BuildContext context, int index) {
          return ChallengeCard(
            title: CardList[index]["title"].toString(),
            description: CardList[index]["description"].toString(),
            isChecked: CardList[index]["isChecked"] as bool,
          );
        },
      ),
    );
  }
}

class ChallengeCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isChecked;
  const ChallengeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isChecked});

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 120, 120).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: widget.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    //widget.isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
