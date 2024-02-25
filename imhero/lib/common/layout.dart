import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? action;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.action,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? BACKGROUND_COLOR,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: SizedBox(height: 70.0, child: bottomNavigationBar),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar? renderAppBar() {
    if (title == null && action == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          action!,
        ],
        foregroundColor: Colors.black,
      );
    }
  }
}
