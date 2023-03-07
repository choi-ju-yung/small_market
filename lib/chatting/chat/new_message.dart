import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class new_message extends StatefulWidget {
  const new_message(@required this.cid,{Key? key}) : super(key: key);

  final String cid;
  @override
  State<new_message> createState() => _new_messageState();
}

class _new_messageState extends State<new_message> {

  final _controller = TextEditingController(); // 메시지 보냄과 동시에 창에 없애기 위해서 만듬
  var _userEnterMessage = '';
  void _sendMessage()async{  // 메시지 보내는 함수 (앞에 _ 붙이면 private 임)
    FocusScope.of(context).unfocus(); // 빈화면 선택시 키보드 없애기
    final user = FirebaseAuth.instance.currentUser; // currentUser 값을 user에 넣음
    final userData = await FirebaseFirestore.instance.collection('user').doc(user!.uid).get();

    FirebaseFirestore.instance.collection('chat'+widget.cid).add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),    // 메시지 시간순으로 정렬하기 위해 사용
      'userID' : user.uid,
      'userName' : userData.data()!['userName']
    });
    _controller.clear(); // 메시지 없애기
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row( // 가로로
        children: [
          // IconButton(
          //     onPressed: (){}, icon: Icon(Icons.image)),
          // IconButton(
          //     onPressed: (){}, icon: Icon(Icons.face)),

          Expanded(
            child: TextField( // 입력할 수 있는 텍스트 필드
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(labelText: "메시지 전송"),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
              onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,  // 메시지를 아무것도 입력하지 않으면 메시지 버튼 비활성화
              icon: Icon(Icons.send),
              color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
