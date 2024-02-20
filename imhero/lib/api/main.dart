import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../common/firebase_options.dart';
import './challenge.dart';
import './community.dart';
import './post_create.dart';
import './home.dart';
import './login.dart';
import './map.dart';
import './post_delete.dart';
import './post_detail.dart';
import './post_edit.dart';
import './signup.dart';
import './user_detail.dart';
import './user_edit.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final routes = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: HomePage()),
  '/:id': (route) => const MaterialPage(child: UserDetailPage()),
  '/:id/edit': (route) => const MaterialPage(child: UserEditPage()),
  '/login': (route) => const MaterialPage(child: LoginPage()),
  '/signup': (route) => const MaterialPage(child: SignupPage()),
  '/challenge': (route) => const MaterialPage(child: ChallengePage()),
  '/community': (route) => const MaterialPage(child: PostsPage()),
  '/community/create': (route) => const MaterialPage(child: CreatePostPage()),
  '/community/:id': (route) => MaterialPage(
        child: PostDetailPage(postId: route.pathParameters['id']!),
      ),
  '/community/:id/edit': (route) =>
      MaterialPage(child: PostEditPage(postId: route.pathParameters['id']!)),
  '/community/:id/delete': (route) =>
      MaterialPage(child: PostDeletePage(postId: route.pathParameters['id']!)),
  '/map': (route) => const MaterialPage(child: MapPage()),
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (contx) {
        return routes;
      }),
      title: "APP",
      debugShowCheckedModeBanner: false,
    );
  }
}
