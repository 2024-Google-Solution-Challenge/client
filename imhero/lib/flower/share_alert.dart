import 'package:flutter/material.dart';

AlertDialog shareAlert(BuildContext context) {
  // share to instagram, facebook, twitter, etc.
  return AlertDialog(
    title: const Text('Share'),
    content: const Text('Share to Instagram, Facebook, Twitter, etc.'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Close'),
      ),
    ],
  );
}
