import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';

class PickerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickerDemoState();
}

class PickerDemoState extends State<PickerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('주변 검색 임시')),
        body: Center( //showPlacePicker()
          child:  TextButton(
            child: Text("Pick Delivery location"),
            onPressed: () {
              showPlacePicker();
            },
          ),

        )
    );
  }

  showPlacePicker() async {
    LocationResult? result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PlacePicker("AIzaSyB-Zk0Di0UNabRvdYPir5-rT6S8pZ4H1Fc")));

    // Handle the result in your way
    print(result);
  }
}
