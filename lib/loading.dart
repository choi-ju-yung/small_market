import 'package:flutter/material.dart';


class loading extends StatelessWidget {
  const loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("우리 동네 소형마트",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Cafe24Ohsquare',
              ),
            ),
            Text("우동(소)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )
            ),
            SizedBox(
              height: 150.0,
            ),
            Center(
              child: LinearProgressIndicator(), // 선이 로딩되면서 표시됨
              //CircularProgressIndicator(),  // 원이 로딩되면서 표시됨
            ),
            SizedBox(
              height: 15.0,
            ),
            Text("  로딩중...",
            style: TextStyle(
              fontSize: 30.0
            ),
            )
          ],
        ),
      ),
    );
  }
}
