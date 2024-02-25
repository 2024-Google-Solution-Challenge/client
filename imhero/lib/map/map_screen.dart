// import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:imhero/map/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:rolling_switch/rolling_switch.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late ClusterManager _manager;
  late GoogleMapController mapController;
  bool isMapMode = true;

  Set<Marker> markers = Set();

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'place1',
          latLng: LatLng(37.590001 + i * 0.1, 127.027635 + i * 0.1))
  ];
  final LatLng _initialPosition =
      const LatLng(37.590001, 127.027635); // 초기 위치 설정

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
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
    return Scaffold(
      body: Stack(
        children: [
          if (isMapMode) buildMap(),
          if (!isMapMode) buildList(),
          Positioned(
            left: 16,
            top: 16,
            child: RollingSwitch.icon(
              onChanged: (bool state) {
                print('turned ${(state) ? 'on' : 'off'}');
                setState(() {
                  isMapMode = !state; // 상태에 따라 맵 모드 또는 리스트 모드로 전환
                });
              },
              rollingInfoRight: const RollingIconInfo(
                icon: Icons.view_list_rounded,
                text: Text('List'),
              ),
              rollingInfoLeft: const RollingIconInfo(
                icon: Icons.location_on_outlined,
                backgroundColor: Colors.grey,
                text: Text('Map'),
              ),
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
        child: Icon(Icons.update),
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
    // 리스트 화면을 구성하는 위젯을 반환
    // 리스트 형태로 Challenge들을 보여주는 화면으로 변경
    return Container(
      color: Colors.white, // 리스트 화면 배경색
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            // 리스트 아이템에 대한 구현
          );
        },
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p));
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
