import 'package:second_active/chatting/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class message extends StatelessWidget {
  const message(this.cid, {Key? key}) : super(key: key);
  final String cid;
  @override
  Widget build(BuildContext context) {

    String a = "chat"+cid;
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(a).orderBy('time',descending: true).snapshots(), // 파이어베이스 안에 chat 콜렉션 연동(구독)
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){ // 기다리고 있을 때 원형로딩중 창 띄움
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length, // 스냅샷 데이터가 가지고있는 다큐먼트 길이
            itemBuilder: (context, index){
              return chat_bubble(
                  chatDocs[index]['text'],
                  chatDocs[index]['userID'].toString() == user!.uid,
                  chatDocs[index]['userName']
              ); // 모든메시지는 텍스트 형태여야 함
          },
          );
    },
    );
  }
}

