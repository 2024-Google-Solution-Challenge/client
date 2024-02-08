import 'dart:ffi' hide Size;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/layout.dart';
import 'package:imhero/common/text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imhero/login/sign_up_screen.dart';
import 'package:imhero/flower/flower_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: app_width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: app_height * 0.05),

                // logo
                Image.asset(
                  'assets/img/login_logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),

                SizedBox(height: app_height * 0.05),

                // bar
                Container(
                  width: 320,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFCBD2E0),
                      ),
                    ),
                  ),
                ),

                // login part
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        app_width * 0.1, 25, app_width * 0.1, 20),
                    child: Column(children: [
                      LoginTextFormField(
                        hintText: 'ID',
                        autofocus: true,
                        onChanged: (String value) {
                          username = value;
                        },
                      ),
                      const SizedBox(height: 12),
                      LoginTextFormField(
                        hintText: 'PW',
                        autofocus: false,
                        onChanged: (String value) {
                          username = value;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                              // print("sign up button");
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.fromLTRB(app_width * 0.075, 10,
                                        app_width * 0.075, 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              PRIMARY_COLOR, // your color here
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25)))),
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: PRIMARY_COLOR),
                            ),
                          ),
                          SizedBox(
                            width: app_width * 0.05,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FlowerScreen()));
                              print('sign in button');
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.fromLTRB(app_width * 0.075, 10,
                                        app_width * 0.075, 10)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        PRIMARY_COLOR),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              PRIMARY_COLOR, // your color here
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25)))),
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),

                // bar
                Container(
                  width: 320,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFCBD2E0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                // google login
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        app_width * 0.12, 8, app_width * 0.12, 0),
                    child: TextButton(
                      onPressed: () {
                        print('sign in button - google');
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(
                                  app_width * 0.01, 10, app_width * 0.01, 10)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black, // your color here
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/google.png',
                            width: MediaQuery.of(context).size.width / 15 * 1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
