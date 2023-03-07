import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_active/menu/map.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 44,
        selectedItemColor: Colors.blue, // 클릭된 아이콘은 파란색으로 표시
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘은 회색으로 표시
        selectedLabelStyle: TextStyle(fontSize: 12), // 아이콘 밑 텍스트 글씨 크기

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 상단에 맞춰 정렬
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Map()),
                );
              }, child: null,
            ),
            Text('서울',
              style: TextStyle(fontSize: 30),
            ),
            Text('인천',
              style: TextStyle(fontSize: 30),
            ),
            Text('경기도',
              style: TextStyle(fontSize: 30),
            ),
            Text('강원도',
              style: TextStyle(fontSize: 30),
            ),
            Text('대전',
              style: TextStyle(fontSize: 30),
            ),
            Text('대구',
              style: TextStyle(fontSize: 30),
            ),
            Text('광주',
              style: TextStyle(fontSize: 30),
            ),
            Text('부산',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}



