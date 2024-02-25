import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place with ClusterItem {
  final String name;
  final LatLng latLng;
  final String title;
  final String description;

  Place({
    required this.name,
    required this.latLng,
    required this.title,
    required this.description,
  });

  @override
  LatLng get location => latLng;
}
