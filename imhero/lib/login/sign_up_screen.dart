import "package:flutter/material.dart";
import 'package:async/async.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/layout.dart';
import 'package:imhero/common/text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imhero/login/login_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routemaster/routemaster.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

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
                    decoration: const ShapeDecoration(
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
                          inputcontroller: _nickController,
                          onChanged: (String value) {
                            _nickname = value;
                          },
                        ),
                        const SizedBox(height: 12),
                        SignupTextFormField(
                          hintText: 'ID',
                          autofocus: false,
                          inputcontroller: _emailController,
                          onChanged: (String value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(height: 12),
                        SignupTextFormField(
                          hintText: 'PW',
                          autofocus: true,
                          inputcontroller: _pwdController,
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
                        submitbutton(app_width),
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

  TextButton submitbutton(double app_width) {
    return TextButton(
      onPressed: () async {
        // print('Sign up button pressed'); // 디버그 출력 추가

        if (_formkey.currentState!.validate()) {
          // print('Form is valid');
          try {
            UserCredential authResult =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _pwdController.text,
            );

            print('User signed up');
            // Firestore에 사용자 정보 추가
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(authResult.user!.uid)
                .set({
              // 'name', 'email', 등 사용자 정보를 추가할 수 있습니다.
              'email': _emailController.text,
              'name': _nickController.text,
              'level': 1,
              'progress': 0,
              'profile_image': "",
              'exp': 0,
              'user_flower_counts': {
                'flower1': 0,
                'flower2': 0,
                'flower3': 0,
                'flower4': 0,
                'flower5': 0,
                'flower6': 0,
              },
              'user_waterdrop_counts': {
                'waterdrop1': 0,
                'waterdrop2': 0,
                'waterdrop3': 0,
                'waterdrop4': 0,
                'waterdrop5': 0,
                'waterdrop6': 0,
              },
            });
            // });

            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  //Dialog Main Title
                  title: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/img/imhero.png',
                        width: MediaQuery.of(context).size.width / 3 * 2,
                      ),
                      new Text("Sign up Complete!!"),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Have a Good TIme in I'm Hero :)",
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: PRIMARY_COLOR),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
          } on FirebaseAuthException catch (e) {
            print("catch");
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            } else
              print(e);
          } catch (e) {
            print(e.toString());
          }
        }
        print('sign up - sign up page');
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.fromLTRB(app_width * 0.23, 12, app_width * 0.23, 12)),
          backgroundColor: MaterialStateProperty.all<Color>(TEXT_COLOR),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black, // your color here
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30)))),
      child: Text(
        'Sign up',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
