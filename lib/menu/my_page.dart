

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:second_active/menu/my_page_fuction/send_mail.dart';
import 'package:second_active/menu/my_page_fuction/Notice.dart';
import 'package:second_active/menu/my_page_fuction/FAQ.dart';


class my_page extends StatefulWidget {
  const my_page({Key? key}) : super(key: key);

  @override
  State<my_page> createState() => _my_pageState();
}


class _my_pageState extends State<my_page> {
  String name = '';

  final _authentication = FirebaseAuth.instance; // 사용자 인증

  Widget _line(){
    return SizedBox(
      width: 380.0,
      height: 20.0,
      child: Divider(
        color: Colors.black26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    User? loggedUser;
    final user = _authentication.currentUser; // 현재 사용자 유저값 정보 가져오기
    if (user != null) { // 로그인한 것이 본인유저이면
      loggedUser = user; // 그 로그인한 유저의 내용을 loggedUser에 대입
    }

    var uid = loggedUser?.uid;
    var email = loggedUser?.email;
    //




//     return Scaffold(
//       appBar: AppBar(title: Text("테스트페이지"),),
//       body: Center(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(height: 100,),
//               Text(name),
//               ElevatedButton(
//                 onPressed: () async{
//                   DocumentSnapshot test1doc = await FirebaseFirestore.instance.collection("user").doc("$uid").get();
//                           setState(() {
//                             name = test1doc['userName'];
//                           });
//                       print(uid);
//                       print(name);
//                     },
//                    child: Text("데이터 불러오기"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/image/웃음.png'),
              ),
              Text("우동(소)에 오신 것을 환영합니다."),

              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.people, color: Colors.teal),
                    label: Text("이름",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                  Text(":",
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                    ),
                  ),
                  Text(' '+name,
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),

                  SizedBox(
                    width: 160,
                  ),

                  IconButton(
                    icon: Icon(Icons.settings),
                      onPressed: () async{
                        DocumentSnapshot test1docData = await FirebaseFirestore.instance.collection('user').doc("$uid").get();

                        setState(() {
                          name = test1docData['userName'];
                        });
                      },
                  ),
                ],
              ),


              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.email, color: Colors.teal),
                    label: Text('$email',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Notice()),);
                    },
                    icon: Icon(Icons.speaker_notes, color: Colors.teal),
                    label: Text('공지사항',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.event_available, color: Colors.teal),
                    label: Text('이벤트',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()),);
                      },
                    icon: Icon(Icons.question_answer, color: Colors.teal),
                    label: Text('FAQ',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => send_mail()),);
                      },
                    icon: Icon(Icons.headphones, color: Colors.teal),
                    label: Text('1:1문의',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _authentication.signOut();
                    },
                    icon: Icon(Icons.people, color: Colors.teal),
                    label: Text("로그아웃",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

























    // final a = firestore.collection('user').doc("$uid").get().then((DocumentSnapshot ds){
    //     var email = ds["email"];
    //     var name = ds["userName"];
    //     return name;
    //   });



    // CollectionReference product = FirebaseFirestore.instance.collection('user'); // 파이어베이스에 파이어스토어의 데이터 컨트롤 (user 컬렉션)
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: StreamBuilder(
//         stream: product.snapshots(),
//         builder: (BuildContext context,
//             AsyncSnapshot<QuerySnapshot> streamSnapshot){
//           if(streamSnapshot.hasData){
//             if(user != null)
//             return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length,
//                 itemBuilder: (context, index){
//                   final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
//                   return Card(
//                     child: ListTile(
//                       title: Text(documentSnapshot['userName']),
//                       subtitle: Text(documentSnapshot['email']),
//                     ),
//                   );
//                 },
//             );
//           }
//           return CircularProgressIndicator();
//         },
//         ),
//       );
//   }
// }





//    var a = firestore.collection('user').doc("$uid").get().then((DocumentSnapshot ds){
//         var email = ds["email"];
//         var name = ds["userName"];
//         return name;
//       });
//
//
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50.0,
//               backgroundImage: AssetImage('./image/웃음.png'),
//             ),
//             FlatButton(
//               color: Color(0xffaf0022),
//               child:
//               Text("member 한명 가져오기", style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 String title = "";
//                 var a = firestore
//                     .collection("user")
//                     .doc("$uid")
//                     .get()
//                     .then((DocumentSnapshot ds) {
//                   var name = ds["userName"];
//                   return name;
//                 });
//               },
//             ),
//             Text(
//               '$a',
//               style: TextStyle(
//                   fontFamily: 'Pacifico',
//                   fontSize: 40.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               '$a',
//               style: TextStyle(
//                   fontFamily: 'Source Sans Pro',
//                   fontSize: 40.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               'Flutter Student',
//               style: TextStyle(
//                   fontSize: 20.0,
//                   fontFamily: 'Source Sans Pro',
//                   color: Colors.teal.shade100,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2.5),
//             ),
//             SizedBox(
//               width: 150.0,
//               height: 20.0,
//               child: Divider(
//                 color: Colors.teal.shade100,
//               ),
//             ),
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//               child: ListTile(
//                 leading: Icon(
//                   Icons.phone,
//                   color: Colors.teal,
//                 ),
//                 title: Text(
//                   '+91 1234 567890',
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       fontFamily: 'Source Sans Pro',
//                       color: Colors.teal.shade900),
//                 ),
//               ),
//             ),
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//               child: ListTile(
//                 leading: Icon(
//                   Icons.email,
//                   color: Colors.teal,
//                 ),
//                 title: Text(
//                   'keertirajmalik@gmail.com',
//                   style: TextStyle(
//                       fontFamily: 'Source Sans Pro',
//                       fontSize: 20.0,
//                       color: Colors.teal.shade900),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



    // return Scaffold(
    //   backgroundColor: Colors.teal,
    //   body: StreamBuilder(
    //     stream: product.snapshots(),
    //     builder: (BuildContext context,
    //         AsyncSnapshot<QuerySnapshot> streamSnapshot){
    //       if(streamSnapshot.hasData){
    //         if(user != null)
    //         return ListView.builder(
    //             itemCount: streamSnapshot.data!.docs.length,
    //             itemBuilder: (context, index){
    //               final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
    //               return Card(
    //                 child: ListTile(
    //                   title: Text(documentSnapshot['userName']),
    //                   subtitle: Text(documentSnapshot['email']),
    //                 ),
    //               );
    //             },
    //         );
    //       }
    //       return CircularProgressIndicator();
    //     },
    //     ),
    //   );
    //


    // body: SafeArea(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //
    //       CircleAvatar(
    //         radius: 50.0,
    //         backgroundImage: AssetImage('./image/웃음.png'),
    //       ),
    //       Text(
    //         'Game Monk',
    //         style: TextStyle(
    //             fontFamily: 'Pacifico',
    //             fontSize: 40.0,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white),
    //       ),
    //       Text(
    //         'Flutter Student',
    //         style: TextStyle(
    //             fontSize: 20.0,
    //             fontFamily: 'Source Sans Pro',
    //             color: Colors.teal.shade100,
    //             fontWeight: FontWeight.bold,
    //             letterSpacing: 2.5),
    //       ),
    //       SizedBox(
    //         width: 150.0,
    //         height: 20.0,
    //         child: Divider(
    //           color: Colors.teal.shade100,
    //         ),
    //       ),
    //       Card(
    //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    //         child: ListTile(
    //           leading: Icon(
    //             Icons.phone,
    //             color: Colors.teal,
    //           ),
    //           title: Text(
    //             '+91 1234 567890',
    //             style: TextStyle(
    //                 fontSize: 20.0,
    //                 fontFamily: 'Source Sans Pro',
    //                 color: Colors.teal.shade900),
    //           ),
    //         ),
    //       ),
    //       Card(
    //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    //         child: ListTile(
    //           leading: Icon(
    //             Icons.email,
    //             color: Colors.teal,
    //           ),
    //           title: Text(
    //             'keertirajmalik@gmail.com',
    //             style: TextStyle(
    //                 fontFamily: 'Source Sans Pro',
    //                 fontSize: 20.0,
    //                 color: Colors.teal.shade900),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),


