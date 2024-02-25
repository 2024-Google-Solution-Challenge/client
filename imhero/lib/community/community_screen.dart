import 'package:flutter/material.dart';
import 'package:imhero/common/button.dart';
import 'package:imhero/community/community_card.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});
  // profile, account name, content, heart, reply,

  @override
  Widget build(BuildContext context) {
    final sample = [
      {
        'profile': 'assets/img/profile.png',
        'accountName': 'accountName',
        'content': 'content',
        'heart': 1,
        'reply': 1,
        'isHearted': true,
      },
      {
        'profile': 'assets/img/profile.png',
        'accountName': 'accountName',
        'content': 'content',
        'heart': 2,
        'reply': 2,
        'isHearted': false,
      },
      {
        'profile': 'assets/img/profile.png',
        'accountName': 'accountName',
        'content': 'content',
        'heart': 3,
        'reply': 3,
        'isHearted': true,
      },
      {
        'profile': 'assets/img/profile.png',
        'accountName': 'accountName',
        'content': 'content',
        'heart': 4,
        'reply': 4,
        'isHearted': false,
      },
    ];
    return Stack(children: [
      ListView.builder(
        itemCount: sample.length,
        itemBuilder: (context, index) {
          return CommunityCard(
            profile: sample[index]['profile'].toString(),
            accountName: sample[index]['accountName'].toString(),
            content: sample[index]['content'].toString(),
            heart: sample[index]['heart'] as int,
            reply: sample[index]['reply'] as int,
            isHearted: sample[index]['isHearted'] as bool,
          );
        },
      ),
      Positioned(
        bottom: 20,
        right: (MediaQuery.of(context).size.width / 2) - 70,
        child: floatingButton('Post', 140, () {
          // Navigator.pushNamed(context, '/add_to_community');
        }),
      ),
    ]);
  }
}
