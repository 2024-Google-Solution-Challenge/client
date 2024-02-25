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
