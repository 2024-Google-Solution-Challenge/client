import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imhero/map/place.dart';
// import 'package:imhero/common/colors.dart'

final List<Map<String, String>> TogetherCardList = [
  {
    "title": "Reduce, Reuse, Recycle Challenge",
    "description":
        "Practice the three Rs: Reduce, Reuse, Recycle. Minimize single-use plastics, repurpose items, and recycle materials."
  },
  {
    "title": "Meatless Monday Challenge",
    "description":
        "Go meat-free every Monday to reduce your carbon footprint. Explore vegetarian or vegan meal options."
  },
  {
    "title": "Zero-Waste Kitchen Challenge",
    "description":
        "Eliminate food waste by meal planning, composting, and using reusable containers."
  },
  {
    "title": "Eco-Friendly Transportation Challenge",
    "description":
        "Choose walking, biking, carpooling, or public transit over driving alone."
  },
  {
    "title": "Energy Conservation Challenge",
    "description":
        "Conserve energy by turning off lights, using energy-efficient appliances, and adjusting your thermostat."
  },
  {
    "title": "Plastic-Free Challenge",
    "description":
        "Switch to reusable alternatives and say no to single-use plastics."
  },
  {
    "title": "Community Clean-Up Challenge",
    "description":
        "Join a clean-up event to remove litter from parks, beaches, or streets."
  },
  {
    "title": "Green Gardening Challenge",
    "description":
        "Grow native plants, conserve water, and attract pollinators in your garden."
  },
  {
    "title": "Digital Detox Challenge",
    "description":
        "Unplug from digital devices and spend time outdoors to reduce electronic waste."
  },
  {
    "title": "Environmental Advocacy Challenge",
    "description":
        "Raise awareness and support eco-friendly policies to protect our planet."
  }
];

List<Place> get items => [
      Place(
        name: TogetherCardList[0]['title']!,
        latLng: LatLng(37.585511, 127.029305),
        title: TogetherCardList[0]['title']!,
        description: TogetherCardList[0]['description']!,
      ),
      Place(
        name: TogetherCardList[1]['title']!,
        latLng: LatLng(37.585766, 127.025178),
        title: TogetherCardList[1]['title']!,
        description: TogetherCardList[1]['description']!,
      ),
      Place(
        name: TogetherCardList[2]['title']!,
        latLng: LatLng(37.587192, 127.026794),
        title: TogetherCardList[2]['title']!,
        description: TogetherCardList[2]['description']!,
      ),
      Place(
        name: TogetherCardList[3]['title']!,
        latLng: LatLng(37.588428, 127.033653),
        title: TogetherCardList[3]['title']!,
        description: TogetherCardList[3]['description']!,
      ),
      Place(
        name: TogetherCardList[4]['title']!,
        latLng: LatLng(37.592643, 127.025150),
        title: TogetherCardList[4]['title']!,
        description: TogetherCardList[4]['description']!,
      ),
      Place(
        name: TogetherCardList[5]['title']!,
        latLng: LatLng(37.590065, 127.036342),
        title: TogetherCardList[5]['title']!,
        description: TogetherCardList[5]['description']!,
      ),
      Place(
        name: TogetherCardList[6]['title']!,
        latLng: LatLng(37.575837, 127.027792),
        title: TogetherCardList[6]['title']!,
        description: TogetherCardList[6]['description']!,
      ),
      Place(
        name: TogetherCardList[7]['title']!,
        latLng: LatLng(37.581606, 127.031548),
        title: TogetherCardList[7]['title']!,
        description: TogetherCardList[7]['description']!,
      ),
    ];

// Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
//       (cluster) async {
//         return Marker(
//           markerId: MarkerId(cluster.getId()),
//           position: cluster.location,
//           onTap: () {
//             String description = ''; // 마커에 대한 설명 생성
//             cluster.items.forEach((p) => description += '${p.name}\n');
//             int contrib = cluster.items.length; // 기여자 수
//             int card = cluster.items.length;
//             _showMarkerInfoDialog(
//                 context, description, contrib, card); // DescriptionCard 표시
//           },
//           icon: await _getMarkerBitmap(
//             cluster.isMultiple ? 125 : 75,
//             text: cluster.isMultiple ? cluster.count.toString() : null,
//           ),
//         );
//       };

//   Future<void> _showMarkerInfoDialog(
//       BuildContext context, String description, int contrib, int card) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         double app_height = MediaQuery.of(context).size.height;
//         double app_width = MediaQuery.of(context).size.width;
//         return Stack(
//           children: [
//             Scaffold(
//               backgroundColor:
//                   Color.fromARGB(0, 255, 255, 255), // 배경을 투명하게 만듭니다.
//               body: Container(), // 터치 이벤트를 막기 위한 빈 컨테이너입니다.
//             ),
//             Positioned(
//               bottom: app_height * 0.05,
//               left: app_width * 0.1,
//               child: Container(
//                 width: app_width * 0.8, // 화면 너비의 80%로 설정
//                 height: app_height * 0.36, // 화면 높이의 50%로 설정
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10), // 내부 패딩 설정
//                 decoration: BoxDecoration(
//                   color: Colors.white, // 배경색 설정
//                   borderRadius: BorderRadius.circular(8), // 모서리 둥글게 설정
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5), // 그림자 색상 및 투명도 설정
//                       spreadRadius: 2, // 그림자 확장 반경 설정
//                       blurRadius: 5, // 그림자 흐림 정도 설정
//                       offset: Offset(0, 3), // 그림자 위치 설정
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           description,
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(width: 40), // 아이콘 버튼과 흰색 네모 사이의 간격
//                         IconButton(
//                           icon: Icon(Icons.close),
//                           color: PRIMARY_COLOR, // 아이콘 버튼의 색상 설정
//                           onPressed: () {
//                             Navigator.of(context).pop(); // 다이얼로그 닫기
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Image.asset(
//                       "assets/img/c$card.png",
//                       width: app_width * 0.8, // 이미지의 너비를 100으로 설정
//                       height: app_height * 0.20,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Icon(Icons.person),
//                         Text(
//                           ' $contrib / 10',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(width: app_width * 0.4),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.chat_bubble_outline_rounded),
//                           color: PRIMARY_COLOR,
//                         ),
//                         SizedBox(width: app_width * 0.01),
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               // Join 상태이면 Cancel 상태로, 그 반대도 마찬가지
//                               isJoining = !isJoining;
//                               contrib++;
//                             });
//                             print("Contrib: $contrib");
//                           },
//                           child: Text(
//                             isJoining ? "Join" : "Cancel", // Join 또는 Cancel 텍스트
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           style: TextButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             backgroundColor: isJoining
//                                 ? Colors.orange // Join 상태일 때 버튼 색상
//                                 : Colors.red, // Cancel 상태일 때 버튼 색상
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
//     if (kIsWeb) size = (size / 2).floor();

//     final PictureRecorder pictureRecorder = PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint1 = Paint()..color = Colors.orange;
//     final Paint paint2 = Paint()..color = Colors.white;

//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

//     if (text != null) {
//       TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//       painter.text = TextSpan(
//         text: text,
//         style: TextStyle(
//             fontSize: size / 3,
//             color: Colors.white,
//             fontWeight: FontWeight.normal),
//       );
//       painter.layout();
//       painter.paint(
//         canvas,
//         Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
//       );
//     }

//     final img = await pictureRecorder.endRecording().toImage(size, size);
//     final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

//     return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
//   }