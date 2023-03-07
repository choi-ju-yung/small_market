import 'package:second_active/chatting/chat/message.dart';
import 'package:second_active/chatting/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';

import 'package:second_active/menu/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



/*
import 'package:example/services/google_map_service.dart';
import 'package:example/models/place.dart';
*/
class ChatScreen extends StatefulWidget {

  const ChatScreen(@required this.cid,{Key? key}) : super(key: key);

  final String cid;


  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // getCurrentUser();
  // }

  // void getCurrentUser(){  // 로그인 성공하면 콘솔화면에 본인의 이메일 출력
  //   try {
  //     final user = _authentication.currentUser;
  //     if (user != null) {
  //       loggedUser = user;
  //       print(loggedUser!.email);
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  // }

  Widget one(String cid){
    return message(cid);
  }

  Widget two(String cid){
    return new_message(cid);
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("채팅"),
        actions: [
          // ElevatedButton.icon(
          // onPressed: (){
          //  _authentication.signOut();
          //   // Navigator.pop(context);
          // },
          // label: Text("로그아웃"),
          // icon: Icon(Icons.exit_to_app_sharp),
          // ),
        ],
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(
                child: one(widget.cid.toString()),
            ),
            two(widget.cid.toString()),// 모든공간을 확보해버리기 때문에 Expanded로 바꿈
          ],
        ),
      ),


    );
  }
}

