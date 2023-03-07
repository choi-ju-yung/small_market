import 'package:flutter/material.dart';

class error extends StatelessWidget {
  const error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      body: Center(
        child: Text("에러화면이다@",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Cafe24Ohsquare'
          ),
        ),
      ),
    );
  }
}