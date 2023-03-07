import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class chat_bubble extends StatelessWidget {
  // 채팅보내는 문자들 스타일 적용
  const chat_bubble(this.message, this.isMe, this.userName, {Key? key})
      : super(key: key);

  final String message;
  final bool isMe; // 본인인지 아닌지 확인하는 부울형 자료형
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe
          ? MainAxisAlignment.end
          : MainAxisAlignment.start, // 보낸사람이 나이면 오른쪽끝으로 배치, 상대방이면 왼쪽끝으로 배치
      children: [
        if (isMe) // 내가 메시지 보낼때 형태
          // Text(
          //   userName,
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: ChatBubble(
              // chat_bubble 이랑 다른거임
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.blue,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ),
          ),

        if (!isMe) // 내가 아닌 다른사람이 메시지보낼 때 형태
          // Text(
          //   userName,
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
              backGroundColor: Color(0xffE7E7ED),
              margin: EdgeInsets.only(top: 20),
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        message,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
          )
      ],
    );
  }
}
