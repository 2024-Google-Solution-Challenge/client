// import 'dart:ffi';

import "package:flutter/material.dart";
import 'package:async/async.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/layout.dart';
import 'package:imhero/common/text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imhero/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();

  String _nickname = '';
  String _username = '';
  String _password = '';
  String _confirmpassword = '';

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formkey,
          child: SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: app_width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: app_height * 0.08),

                  // logo
                  Image.asset(
                    'assets/img/imhero.png',
                    width: MediaQuery.of(context).size.width / 3 * 2,
                  ),
                  SizedBox(height: app_height * 0.02),

                  //bar
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
                        SignupTextFormField(
                          hintText: 'Nick Name',
                          autofocus: true,
                          onChanged: (String value) {
                            _nickname = value;
                          },
                        ),
                        const SizedBox(height: 12),
                        SignupTextFormField(
                          hintText: 'ID',
                          autofocus: false,
                          onChanged: (String value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(height: 12),
                        SignupTextFormField(
                          hintText: 'PW',
                          autofocus: true,
                          onChanged: (String value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xFFACCBC9),
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 6, 6, 6),
                            hintText: 'Confirm PW',
                            hintStyle: const TextStyle(
                              color: Color(0xFFABCBC8),
                              fontSize: 16.0,
                            ),
                            fillColor: Color(0xFFEDF0F7),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCBD2E0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCBD2E0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (value) {
                            setState(() {
                              _confirmpassword = value as String;
                            });
                          },
                          validator: (value) {
                            if (value == null ||
                                value != _password ||
                                value.isEmpty) return 'password is wrong!!!';
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    //Dialog Main Title
                                    title: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/img/imhero.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3 *
                                              2,
                                        ),
                                        new Text("Sign up Complete!!"),
                                      ],
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Have a Good TIme in I'm Hero :)",
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          TextButton(
                                            child: Text(
                                              "Sign in",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color: PRIMARY_COLOR),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(PRIMARY_COLOR),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                              );
                                              print('same password');
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreen()));
                              // print('same password');
                            }
                            print('sign up - sign up page');
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.fromLTRB(app_width * 0.23, 12,
                                      app_width * 0.23, 12)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(TEXT_COLOR),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black, // your color here
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ]),
                    ),
                  ),

                  //bar
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
                  SizedBox(
                    height: 12,
                  ),
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
                                EdgeInsets.fromLTRB(app_width * 0.01, 10,
                                    app_width * 0.01, 10)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
      ),
    );
  }
}

// void FlutterDialog() {
//   showDialog(
//       context: context,
//       //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           //Dialog Main Title
//           title: Column(
//             children: <Widget>[
//               new Text("Dialog Title"),
//             ],
//           ),
//           //
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Dialog Content",
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             new FlatButton(
//               child: new Text("확인"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       });
// }
