import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:location/location.dart';
import 'package:second_active/menu/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '122344';
  List<dynamic> _placesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();

    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {

    if(_sessionToken == null ){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggesion (_controller.text);
  }

  void getSuggesion(String input) async  {

    String kPLACES_API_KEY="AIzaSyB-Zk0Di0UNabRvdYPir5-rT6S8pZ4H1Fc";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    print(data);
    if(response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else {
      throw Exception('Failed to load data');
    }
  }

  void getCurrentUser(){
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        actions: [
          ElevatedButton.icon(
            onPressed: (){
              _authentication.signOut();
              Navigator.pop(context);
            },
            label: Text("로그아웃"),
            icon: Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),

        child: Column(
          children:[
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Search places with name'
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _placesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async{
                          List<Location> locations = await locationFromAddress(_placesList[index]['description']);

                          print(locations.last.longitude);
                          print(locations.last.latitude);
                        },
                        title: Text(_placesList[index]['description']),
                      );
                    }
                )
            ),
            Expanded(child: Center(
              child: Map(),
            ))
          ],
        ),
      ),
    );
  }
}