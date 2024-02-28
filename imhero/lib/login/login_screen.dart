// import 'dart:ffi' hide Size;
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:imhero/common/colors.dart';
import 'package:imhero/common/layout.dart';
import 'package:imhero/common/root_tab.dart';
import 'package:imhero/common/text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imhero/login/sign_up_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String username = '';
  // String password = '';

  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // print("\n\n\n\n\n");
    // print(googleAuth);

    // return await FirebaseAuth.instance.signInWithCredential(
    //   GoogleAuthProvider.credential(
    //     accessToken: googleAuth?.accessToken,
    //     idToken: googleAuth?.idToken,
    //   ),
    // );
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                  child: Form(
                    key: _key,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          app_width * 0.05, 25, app_width * 0.05, 20),
                      child: Column(children: [
                        // LoginTextFormField(
                        //   hintText: 'ID',
                        //   autofocus: true,
                        //   onChanged: (String value) {
                        //     username = value;
                        //   },
                        // ),
                        emailInput(),
                        const SizedBox(height: 12),
                        // LoginTextFormField(
                        //   hintText: 'PW',
                        //   autofocus: false,
                        //   onChanged: (String value) {
                        //     username = value;
                        //   },
                        // ),
                        passwordInput(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                                // print("sign up button");
                              },
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(app_width * 0.075,
                                              10, app_width * 0.075, 10)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color:
                                                PRIMARY_COLOR, // your color here
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: PRIMARY_COLOR),
                              ),
                            ),
                            SizedBox(
                              width: app_width * 0.05,
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  // 여기에 작성
                                  try {
                                    UserCredential authResult =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _pwdController.text,
                                    );

                                    if (authResult.user != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RootTab()));
                                      print('sign in button');
                                      // Routemaster.of(context).push('/');
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      debugPrint(
                                          'No user found for that email.');
                                    } else if (e.code == 'wrong-password') {
                                      debugPrint(
                                          'Wrong password provided for that user.');
                                    }
                                  }
                                }
                              },
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(app_width * 0.075,
                                              10, app_width * 0.075, 10)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          PRIMARY_COLOR),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color:
                                                PRIMARY_COLOR, // your color here
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),

                // bar
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

                const SizedBox(height: 16.0),

                // google login
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        app_width * 0.12, 8, app_width * 0.12, 0),
                    child: TextButton(
                      onPressed: () {
                        signInWithGoogle().then((result) {
                          if (result.additionalUserInfo!.isNewUser) {
                            saveUserInfo(result.user!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RootTab()));
                          }
                        });
                      },
                      // onPressed: () {
                      //   GoogleSignIn _googleSignIn = GoogleSignIn(
                      //     scopes: <String>[
                      //       'email',
                      //       'https://www.googleapis.com/auth/contacts.readonly',
                      //     ],
                      //   );
                      //   _googleSignIn.signIn().then((value) {
                      //     value!.authentication.then((value) {
                      //       FirebaseAuth.instance
                      //           .signInWithCredential(
                      //         GoogleAuthProvider.credential(
                      //             accessToken: value.accessToken,
                      //             idToken: value.idToken,
                      //             ),
                      //       )
                      //           .then((value) {
                      //         saveUserInfo(value.user!);
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const RootTab()));
                      //       });
                      //     });
                      //   });
                      // },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(
                                  app_width * 0.01, 10, app_width * 0.01, 10)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: const BorderSide(
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
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

  TextFormField emailInput() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input your email address.',
        labelText: 'Email Address',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextFormField passwordInput() {
    return TextFormField(
      controller: _pwdController,
      obscureText: true,
      autofocus: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input your password.',
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> saveUserInfo(User user) async {
    try {
      // Firestore의 'users' 컬렉션에 사용자 정보 추가
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        // 추가로 필요한 사용자 정보는 여기에 추가할 수 있습니다.
      });

      print("User info saved to Firestore");
    } catch (e) {
      print("Error saving user info: $e");
    }
  }
}
