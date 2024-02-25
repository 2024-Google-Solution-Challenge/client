import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  String _nickname = '';

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Detail'),
        ),
        body: const Center(
          child: Text('User not logged in.'),
        ),
      );
    }

    return FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection('Users').doc(user.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 데이터를 아직 가져오지 못했을 때의 로딩 상태를 표시합니다.
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Detail'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          // 에러가 발생했을 때 에러 메시지를 표시합니다.
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Detail'),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        var userData = snapshot.data?.data() as Map<String, dynamic>?;

        return Container(
          color: BACKGROUND_COLOR,
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(app_width * 0.05, app_height * 0.2, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MY PAGE',
                  style: TextStyle(
                    color: Color(0xFFFF7510),
                    decoration: TextDecoration.none,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: app_height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
                  children: [
                    Image.asset(
                      'assets/img/profile.png',
                      width: app_width * 0.55,
                    ),
                  ],
                ),
                SizedBox(
                  height: app_height * 0.02,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
                    children: [
                      Text(
                        "${userData?['name'] ?? "N/A"}",
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Nickchange(userData),
                    ]),
                SizedBox(
                  height: app_height * 0.03,
                ),
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
                SizedBox(
                  height: 30,
                ),
                // ID
                const Text(
                  "ID",
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
                    children: [
                      Text(
                        "${userData?['email'] ?? "N/A"}",
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      // SizedBox(
                      //   width: app_width * 0.2,
                      // ),
                      IDchange(userData),
                    ]),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "PassWord",
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
                    children: [
                      Text(
                        "${userData?['email'] ?? "N/A"}",
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      // SizedBox(
                      //   width: app_width * 0.2,
                      // ),
                      IDchange(userData),
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }

  IconButton Nickchange(Map<String, dynamic>? userData) {
    return IconButton(
      onPressed: () async {
        // 현재 사용자 가져오기
        User? currentUser = FirebaseAuth.instance.currentUser;

        if (currentUser != null) {
          // Firestore에서 사용자 정보 가져오기
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser.uid)
              .get();

          // 사용자 정보가 있는지 확인하고 업데이트
          if (userSnapshot.exists) {
            // 사용자 정보 가져오기
            Map<String, dynamic>? userData =
                userSnapshot.data() as Map<String, dynamic>?;

            // 임시 닉네임 변수
            String tempNickname = _nickname;

            // 닉네임 변경 작업
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Change Nickname"),
                  content: TextField(
                    onChanged: (value) {
                      tempNickname = value; // 텍스트가 변경될 때마다 임시 닉네임 업데이트
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // 팝업 닫기
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        // Firebase에 업데이트된 닉네임 저장
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(currentUser.uid)
                            .update({'name': tempNickname});

                        // 업데이트된 닉네임을 화면에 반영
                        setState(() {
                          _nickname = tempNickname;
                        });

                        Navigator.of(context).pop(); // 팝업 닫기
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
      icon: const Icon(Icons.edit_square),
    ); // 아이콘은 수정 아이콘으로 설정됨
  }

  IconButton IDchange(Map<String, dynamic>? userData) {
    return IconButton(
      onPressed: () async {
        // 현재 사용자 가져오기
        User? currentUser = FirebaseAuth.instance.currentUser;

        if (currentUser != null) {
          // Firestore에서 사용자 정보 가져오기
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser.uid)
              .get();

          // 사용자 정보가 있는지 확인하고 업데이트
          if (userSnapshot.exists) {
            // 사용자 정보 가져오기
            Map<String, dynamic>? userData =
                userSnapshot.data() as Map<String, dynamic>?;

            // 임시 닉네임 변수
            String tempNickname = _nickname;

            // 닉네임 변경 작업
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Change Your Email"),
                  content: TextField(
                    onChanged: (value) {
                      tempNickname = value; // 텍스트가 변경될 때마다 임시 닉네임 업데이트
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // 팝업 닫기
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        // Firebase에 업데이트된 닉네임 저장
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(currentUser.uid)
                            .update({'email': tempNickname});

                        // 업데이트된 닉네임을 화면에 반영
                        setState(() {
                          _nickname = tempNickname;
                        });

                        Navigator.of(context).pop(); // 팝업 닫기
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
      icon: const Icon(Icons.edit_square),
    ); // 아이콘은 수정 아이콘으로 설정됨
  }
}




// class MyPageScreen extends StatelessWidget {
//   const MyPageScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double app_height = MediaQuery.of(context).size.height;
//     double app_width = MediaQuery.of(context).size.width;

//     User? user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('User Detail'),
//         ),
//         body: const Center(
//           child: Text('User not logged in.'),
//         ),
//       );
//     }

//     return FutureBuilder<DocumentSnapshot>(
//       future:
//           FirebaseFirestore.instance.collection('Users').doc(user.uid).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // 데이터를 아직 가져오지 못했을 때의 로딩 상태를 표시합니다.
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('User Detail'),
//             ),
//             body: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         if (snapshot.hasError) {
//           // 에러가 발생했을 때 에러 메시지를 표시합니다.
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('User Detail'),
//             ),
//             body: Center(
//               child: Text('Error: ${snapshot.error}'),
//             ),
//           );
//         }

//         var userData = snapshot.data?.data() as Map<String, dynamic>?;

//         return Container(
//           color: BACKGROUND_COLOR,
//           child: Padding(
//             padding:
//                 EdgeInsets.fromLTRB(app_width * 0.05, app_height * 0.2, 0, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'MY PAGE',
//                   style: TextStyle(
//                     color: Color(0xFFFF7510),
//                     decoration: TextDecoration.none,
//                     fontSize: 32,
//                   ),
//                 ),
//                 SizedBox(
//                   height: app_height * 0.06,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment
//                       .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
//                   children: [
//                     Image.asset(
//                       'assets/img/profile.png',
//                       width: app_width * 0.55,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: app_height * 0.02,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment
//                         .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
//                     children: [
//                       Text(
//                         "${userData?['name'] ?? "N/A"}",
//                         style: TextStyle(
//                             fontSize: 20,
//                             decoration: TextDecoration.none,
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal),
//                       ),
//                       // Nickchange(),
//                     ]),
//                 SizedBox(
//                   height: app_height * 0.03,
//                 ),
//                 // ID
//                 Text(
//                   "ID",
//                   style: TextStyle(
//                       fontSize: 16,
//                       decoration: TextDecoration.none,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment
//                         .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
//                     children: [
//                       Text(
//                         "${userData?['name'] ?? "N/A"}",
//                         style: TextStyle(
//                             fontSize: 20,
//                             decoration: TextDecoration.none,
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal),
//                       ),
//                       // Nickchange(),
//                     ]),
//                 // PW
//                 Text(
//                   "ID",
//                   style: TextStyle(
//                       fontSize: 16,
//                       decoration: TextDecoration.none,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment
//                         .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
//                     children: [
//                       Text(
//                         "${userData?['name'] ?? "N/A"}",
//                         style: TextStyle(
//                             fontSize: 20,
//                             decoration: TextDecoration.none,
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal),
//                       ),
//                       // Nickchange(),
//                     ]),

//                 // IDchange(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   IconButton Nickchange(Map<String, dynamic>? userData) {
//     return IconButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             String _nickname = userData?['name'] ?? ''; // 닉네임 변수 선언 및 초기화

//             return AlertDialog(
//               title: Text("Change Nickname"),
//               content: TextField(
//                 onChanged: (value) {
//                   _nickname = value; // 텍스트가 변경될 때마다 닉네임 업데이트
//                 },
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(); // 팝업 닫기
//                   },
//                   child: Text('Cancel'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // 저장 버튼을 눌렀을 때 실행할 작업
//                     setState(() {
//                       // 닉네임을 변경된 값으로 업데이트
//                       // 이때, 변경된 닉네임을 사용하여 작업을 수행
//                       _nickname = _nickname;
//                     });
//                     Navigator.of(context).pop(); // 팝업 닫기
//                   },
//                   child: Text('Save'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//       icon: Icon(Icons.edit_square),
//     ); // 아이콘은 수정 아이콘으로 설정됨
//   }

//   // _MyPageScreenState createState() => _MyPageScreenState();
// }

// // class _MyPageScreenState extends State<MyPageScreen> {
// //   String _nickname = 'nickname';

// //   @override
// //   Widget build(BuildContext context) {
// //     double app_height = MediaQuery.of(context).size.height;
// //     double app_width = MediaQuery.of(context).size.width;

// //     return Container(
// //       color: BACKGROUND_COLOR,
// //       child: Padding(
// //         padding: EdgeInsets.fromLTRB(app_width * 0.05, app_height * 0.2, 0, 0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'MY PAGE',
// //               style: TextStyle(
// //                 color: Color(0xFFFF7510),
// //                 decoration: TextDecoration.none,
// //                 fontSize: 32,
// //               ),
// //             ),
// //             SizedBox(
// //               height: app_height * 0.06,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment
// //                   .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
// //               children: [
// //                 Image.asset(
// //                   'assets/img/profile.png',
// //                   width: app_width * 0.55,
// //                 ),
// //               ],
// //             ),
// //             SizedBox(
// //               height: app_height * 0.02,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment
// //                   .center, // 그림을 중앙 정렬하기 위해 MainAxisAlignment.center 사용
// //               children: [
// //                 Text(
// //                   _nickname,
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       decoration: TextDecoration.none,
// //                       color: Colors.black,
// //                       fontWeight: FontWeight.normal),
// //                 ),
// //                 Nickchange(),
// //                 SizedBox(
// //                   height: app_height * 0.03,
// //                 ),
// //                 IDchange(),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   IconButton IDchange() {
// //     return IconButton(
// //       onPressed: () {
// //         showDialog(
// //           context: context,
// //           builder: (BuildContext context) {
// //             return AlertDialog(
// //               title: Text("Change ID"),
// //               content: TextField(
// //                 onChanged: (value) {
// //                   _nickname = value; // 텍스트가 변경될 때마다 _nickname을 업데이트
// //                 },
// //               ),
// //               actions: [
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pop(); // 팝업 닫기
// //                   },
// //                   child: Text('Cancel'),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     // 저장 버튼을 눌렀을 때 실행할 작업
// //                     setState(() {
// //                       // 텍스트를 변경된 값으로 업데이트
// //                       // 이때, 원래 텍스트를 변경된 텍스트로 교체하는 작업을 수행
// //                       _nickname = _nickname;
// //                     });
// //                     Navigator.of(context).pop(); // 팝업 닫기
// //                   },
// //                   child: Text('Save'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //       icon: Icon(Icons.edit_square),
// //     ); // 아이콘은 수정 아이콘으로 설정됨
// //   }

// //   IconButton Nickchange() {
// //     return IconButton(
// //       onPressed: () {
// //         showDialog(
// //           context: context,
// //           builder: (BuildContext context) {
// //             return AlertDialog(
// //               title: Text("Change Nickname"),
// //               content: TextField(
// //                 onChanged: (value) {
// //                   _nickname = value; // 텍스트가 변경될 때마다 _nickname을 업데이트
// //                 },
// //               ),
// //               actions: [
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pop(); // 팝업 닫기
// //                   },
// //                   child: Text('Cancel'),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     // 저장 버튼을 눌렀을 때 실행할 작업
// //                     setState(() {
// //                       // 텍스트를 변경된 값으로 업데이트
// //                       // 이때, 원래 텍스트를 변경된 텍스트로 교체하는 작업을 수행
// //                       _nickname = _nickname;
// //                     });
// //                     Navigator.of(context).pop(); // 팝업 닫기
// //                   },
// //                   child: Text('Save'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //       icon: Icon(Icons.edit_square),
// //     ); // 아이콘은 수정 아이콘으로 설정됨
// //   }
// // }
