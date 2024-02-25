import 'package:flutter/material.dart';
import 'package:imhero/login/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:imhero/mypage/mypage_screen.dart';
import 'package:imhero/common/root_tab.dart';
import 'package:imhero/flower/share_alert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // body: MyPageScreen(),
          //body: SplashScreen(),
          body: shareAlert(context, 1)),
    );
  }
}
