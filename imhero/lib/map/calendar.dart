import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
