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

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late ClusterManager _manager;
  late GoogleMapController mapController;
  // bool isMapMode = true;

  final TogetherCardList = [
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

  Set<Marker> markers = Set();

  List<Place> items = [
    Place(name: 'place1', latLng: LatLng(37.585511, 127.029305)),
    Place(name: 'hana Sciencehall', latLng: LatLng(37.585766, 127.025178)),
    Place(name: 'anam hospital', latLng: LatLng(37.587192, 127.026794)),
    Place(name: 'KOREA UNIV. main park', latLng: LatLng(37.588428, 127.033653)),
    Place(name: 'main gym', latLng: LatLng(37.592643, 127.025150)),
    Place(name: 'KOREA UNIV. Station', latLng: LatLng(37.590065, 127.036342)),
    Place(name: 'sungbuk river', latLng: LatLng(37.575837, 127.027792)),
    Place(name: 'jongam elementary', latLng: LatLng(37.581606, 127.031548)),
  ];
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
              activeChild: Icon(
                Icons.view_list_rounded,
                color: Colors.white,
              ),
              inactiveChild: Icon(
                Icons.location_on_outlined,
              ),
              activeColor: PRIMARY_COLOR,
              inactiveColor: PRIMARY_COLOR,
              width: 60,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _manager.setItems(<Place>[
            for (int i = 0; i < 30; i++)
              Place(
                  name: 'New Place ${DateTime.now()} $i',
                  latLng: LatLng(48.858265 + i * 0.01, 2.350107))
          ]);
        },
        child: const Icon(Icons.update),
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
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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

  Future<void> _showMarkerInfoDialog(
      BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Marker Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            String message = ''; // 마커에 대한 정보 생성
            cluster.items.forEach((p) => message += '${p.name}\n');
            _showMarkerInfoDialog(context, message); // 다이얼로그 표시
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

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
