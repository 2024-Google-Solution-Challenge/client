import 'package:flutter/material.dart';
import 'package:imhero/common/button.dart';
import 'package:imhero/community/community_card.dart';
import 'package:imhero/community/post_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});
  // profile, account name, content, heart, reply,

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool postStatus = false;
  @override
  Widget build(BuildContext context) {
    final sample = [
      {
        'profile': 'assets/img/profile1.png',
        'accountName': 'LeafySam',
        'content':
            '🌿 Calling all eco-warriors! 🌍✨ Who\'s ready to embark on a "plogging" adventure today? 🏃‍♂️💨 Let\'s hit the streets, get our hearts pumping, and make our planet cleaner one stride at a time! 🌱🚯🌟 Together, we can make a difference and leave a greener, cleaner world for generations to come! 💚 #PloggingAdventure #CleanStreets 🌎🏃‍♀️',
        'heart': 1,
        'reply': 1,
        'isHearted': true,
      },
      {
        'profile': 'assets/img/profile2.png',
        'accountName': 'GreenTina',
        'content':
            '🌟 Today, I nailed my recycling game! ♻️💪 Feeling proud of my eco-friendly choices! 🌍 Let\'s keep up the good work for a greener world! 🌱🌟 #RecyclingWin #EcoHero 🌿👍',
        'heart': 2,
        'reply': 2,
        'isHearted': false,
      },
      {
        'profile': 'assets/img/profile3.png',
        'accountName': 'SproutiePie',
        'content':
            'Pack your bags🎒 and join the digital nomad tribe! Explore exotic destinations, conquer remote work challenges, and unlock the secrets of work-life balance on the road. Get ready to embrace freedom, adventure, and endless possibilities! 🌏🌴',
        'heart': 3,
        'reply': 3,
        'isHearted': true,
      },
      {
        'profile': 'assets/img/profile4.png',
        'accountName': 'NatureNook',
        'content':
            'Join the eco-conscious movement!🌳🌿🌱 Let\'s take a journey together to explore simple yet impactful ways to live sustainably. From reducing plastic waste to embracing renewable energy, together, we can make a positive change for our planet! 🌍💚',
        'heart': 4,
        'reply': 4,
        'isHearted': false,
      },
    ];
    return postStatus
        ? postScreen(
            postButton('Post', 100, true, () {
              setState(() {
                postStatus = false;
              });
            }),
            postButton('Cancel', 100, false, () {
              setState(() {
                postStatus = false;
              });
            }),
          )
        : Stack(children: [
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
                setState(() {
                  postStatus = true;
                });
              }),
            ),
          ]);
  }
}
