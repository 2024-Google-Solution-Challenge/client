import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:imhero/map/place.dart';
import 'package:imhero/map/challenge_tag.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:imhero/common/button.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:imhero/common/colors.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:imhero/map/description_card.dart';
import 'package:imhero/map/map_plus.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late ClusterManager _manager;
  late GoogleMapController mapController;
  bool isJoining = true;

  Set<Marker> markers = Set();

  final LatLng _initialPosition =
      const LatLng(37.590001, 127.027635); // 초기 위치 설정

  final _controllerswitch = ValueNotifier<bool>(false);
  bool _checked = false;

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
    super.initState();

    _controllerswitch.addListener(() {
      setState(() {
        if (_controllerswitch.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      });
    });
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          if (!_controllerswitch.value) buildMap(),
          if (_controllerswitch.value) buildList(),
          Positioned(
            left: 16,
            top: app_height * 0.01,
            child: AdvancedSwitch(
              controller: _controllerswitch,
              activeChild: const Icon(
                Icons.view_list_rounded,
                color: Colors.white,
              ),
              inactiveChild: const Icon(
                Icons.location_on_outlined,
              ),
              activeColor: PRIMARY_COLOR,
              inactiveColor: PRIMARY_COLOR,
              width: 60,
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 120,
              bottom: 10,
              child: floatingButton("Create new challenge", 240, () {})),
        ],
      ),
    );
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 16,
      ),
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        _manager.setMapId(controller.mapId);
      },
      onCameraMove: _manager.onCameraMove,
      onCameraIdle: _manager.updateMap,
    );
  }

  Widget buildList() {
    double app_height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // 배경색 설정
      ),
      child: Column(
        children: [
          const SizedBox(height: 80),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Together Challenge List",
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: TogetherCardList.map((e) => TogetherCard(
                          title: e["title"].toString(),
                          description: e["description"].toString(),
                        )).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            String description = ''; // 마커에 대한 설명 생성
            cluster.items.forEach((p) => description += '${p.name}\n');
            int contrib = cluster.items.length; // 기여자 수
            int card = cluster.items.length;
            _showMarkerInfoDialog(
                context, description, contrib, card); // DescriptionCard 표시
          },
          icon: await _getMarkerBitmap(
            cluster.isMultiple ? 125 : 75,
            text: cluster.isMultiple ? cluster.count.toString() : null,
          ),
        );
      };

  Future<void> _showMarkerInfoDialog(
      BuildContext context, String description, int contrib, int card) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        double app_height = MediaQuery.of(context).size.height;
        double app_width = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            Scaffold(
              backgroundColor:
                  Color.fromARGB(0, 255, 255, 255), // 배경을 투명하게 만듭니다.
              body: Container(), // 터치 이벤트를 막기 위한 빈 컨테이너입니다.
            ),
            Positioned(
              bottom: app_height * 0.05,
              left: app_width * 0.1,
              child: Container(
                width: app_width * 0.8, // 화면 너비의 80%로 설정
                height: app_height * 0.36, // 화면 높이의 50%로 설정
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10), // 내부 패딩 설정
                decoration: BoxDecoration(
                  color: Colors.white, // 배경색 설정
                  borderRadius: BorderRadius.circular(8), // 모서리 둥글게 설정
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 그림자 색상 및 투명도 설정
                      spreadRadius: 2, // 그림자 확장 반경 설정
                      blurRadius: 5, // 그림자 흐림 정도 설정
                      offset: const Offset(0, 3), // 그림자 위치 설정
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 35), // 아이콘 버튼과 흰색 네모 사이의 간격
                        IconButton(
                          icon: Icon(Icons.close),
                          color: PRIMARY_COLOR, // 아이콘 버튼의 색상 설정
                          onPressed: () {
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      "assets/img/c$card.png",
                      width: app_width * 0.8, // 이미지의 너비를 100으로 설정
                      height: app_height * 0.20,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(
                          ' $contrib / 10',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: app_width * 0.4),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chat_bubble_outline_rounded),
                          color: PRIMARY_COLOR,
                        ),
                        SizedBox(width: app_width * 0.01),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              // Join 상태이면 Cancel 상태로, 그 반대도 마찬가지
                              isJoining = !isJoining;
                              contrib++;
                            });
                            print("Contrib: $contrib");
                          },
                          child: Text(
                            isJoining ? "Join" : "Cancel", // Join 또는 Cancel 텍스트
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: isJoining
                                ? Colors.orange // Join 상태일 때 버튼 색상
                                : Colors.red, // Cancel 상태일 때 버튼 색상
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
