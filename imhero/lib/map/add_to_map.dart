import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:geocoding/geocoding.dart';

import 'package:imhero/common/colors.dart';
import 'package:imhero/common/button.dart';
import 'package:imhero/common/root_tab.dart';
import 'package:imhero/common/style.dart';
import 'package:imhero/common/text_form_field.dart';

import 'package:imhero/map/place.dart';
import 'package:imhero/map/map_screen.dart';

class AddChallengeToMap extends StatefulWidget {
  final void Function() onBackButtonPress;

  const AddChallengeToMap({
    Key? key,
    required this.onBackButtonPress,
  }) : super(key: key);

  @override
  AddChallengeToMapState createState() => AddChallengeToMapState();
}

class AddChallengeToMapState extends State<AddChallengeToMap> {
  String location = "";
  String title = "";
  String description = "";
  int peopleNumber = 1;

  final LatLng _initialPosition = const LatLng(37.590001, 127.027635);

  late GoogleMapController mapController;
  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("initial"),
      position: LatLng(37.590001, 127.027635),
      infoWindow: InfoWindow(
        title: 'Your Location',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onMapTap(LatLng latLng) async {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: InfoWindow(
              title: 'Location',
              snippet: "${latLng.latitude}, ${latLng.longitude}"),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      location = // convert to address by using geocoding
          "${latLng.latitude}, ${latLng.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Add Challenge to Map",
                  style: underLineTextStyle(),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  onTap: _onMapTap,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 16,
                  ),
                  markers: markers,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: INPUT_BORDER_COLOR,
                    width: 1.0,
                  ),
                  color: INPUT_BG_COLOR,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  location == "" ? "Set Location on Map" : location,
                  style: const TextStyle(
                    fontSize: 15,
                    color: BODY_TITLE_COLOR,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: "Title",
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: "Description",
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: INPUT_BORDER_COLOR,
                    width: 1.0,
                  ),
                  color: INPUT_BG_COLOR,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "People Number",
                      style: TextStyle(
                        fontSize: 15,
                        color: BODY_TITLE_COLOR,
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (peopleNumber > 1) {
                                setState(() {
                                  peopleNumber--;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            peopleNumber.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: BODY_TITLE_COLOR,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                peopleNumber++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              postButton(
                  "Add Challenge", 300, false, () => widget.onBackButtonPress())
            ],
          ),
        ),
      ),
    );
  }
}
