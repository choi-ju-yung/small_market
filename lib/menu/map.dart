
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';  // 플러터 고급된 폼 제공하는 모듈
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:second_active/map/nearby_location.dart';
import 'package:second_active/map/nearby_response.dart';
import 'package:second_active/menu/repository/contents_repository.dart';

const kGoogleApiKey = 'AIzaSyB-Zk0Di0UNabRvdYPir5-rT6S8pZ4H1Fc';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class Map extends StatefulWidget {

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<Map> {
  Set<Marker> _markers = Set();//위치 처리용
  Set<Marker> _markers2 = {};//위치 검색용
  int mak2count = 0;
  late ContentsRepository location_data = ContentsRepository();
  String apiKey = "AIzaSyB-Zk0Di0UNabRvdYPir5-rT6S8pZ4H1Fc";//api key
  String radius = "1000"; //자신 위치 기준 반경1km

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  final Mode _mode = Mode.overlay;

  // 애플리케이션에서 지도를 이동하기 위한 컨트롤러
  late GoogleMapController _controller;

  late double latitude;
  late double longitude;
  late double mlat;
  late double mlng;



  // 이 값은 지도가 시작될 때 첫 번째 위치입니다.
  late CameraPosition _initialPosition =
  CameraPosition(
      target: LatLng(37.56412894104462, 126.97927940636872),
      zoom: 10
  );


  _locateMe() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude= position.latitude;
    longitude = position.longitude;
  }
  //컨트롤러
  void onMapCreated(GoogleMapController controller) async {
    _controller = controller;
  }

  //#####################################################
  // 지도 클릭 시 표시할 장소에 대한 마커 목록
  addMarker(cordinate) {
    int id = Random().nextInt(100);
    double aa = cordinate.latitude;
    double bb = cordinate.longitude;
    print(aa);
    print(bb);
    setState(() {
      _markers
          .add(Marker(
          position: cordinate,
          markerId: MarkerId(id.toString()),
          infoWindow: InfoWindow(
              title: "10",
              snippet: "lat: " + aa.toString() + " , lng: "+bb.toString())
      )
      );

    });
  }

// #######################################################
  //클릭시 주변위치검색
  void getNearbyPlaces() async {

    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + latitude.toString() + ','
        + longitude.toString() + '&radius=' + radius + '&key=' + apiKey
    );

    print(url);
    var response = await http.post(url);


    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));
    print(nearbyPlacesResponse.results![0].name);


    for (int i =0; i<nearbyPlacesResponse.results!.length;i++) {
      double lat = nearbyPlacesResponse.results![i].geometry!.location!.lat as double;//
      double lng = nearbyPlacesResponse.results![i].geometry!.location!.lng as double;//
      _markers.add(//_markers에 더한다
          Marker(//마커를
              position: LatLng(lat,lng),//위치
              markerId: MarkerId(i.toString()),//마커 아이디
              infoWindow: InfoWindow(title: nearbyPlacesResponse.results![i].name, snippet: "id = "+i.toString())//눌렀을때의 정보
          )
      );
      print("Name: " + nearbyPlacesResponse.results![i].name!);//여기는 그냥 콘솔창에 출력
      print("Location: " + lat.toString() + " , " + lng.toString());

    }
    setState(() {});
  }
  //############################################################(37.56412894104462, 126.97927940636872)
  List<location_insert> Test1 = [
    location_insert("name1", 37.59842, 126.76890),
    location_insert("name2", 37.49123, 126.7610),
    location_insert("name3", 37.488300, 126.7660),
    location_insert("name4", 37.491200, 126.765)
  ];

  void get_mak() async
  {
    for (int i =0;i<_markers.length+Test1.length;i++)
    {
      _markers.add(//_markers에 더한다
          Marker(//마커를
              position: LatLng(Test1[i].lat,Test1[i].lng),//위치
              markerId: MarkerId(i.toString()),//마커 아이디
              infoWindow: InfoWindow(title: Test1[i].name, snippet: "id = "+i.toString())//눌렀을때의 정보
          )
      );

      print("Name: " + Test1[i].name!);//여기는 그냥 콘솔창에 출력
      print("Location: " + Test1[i].lat.toString() + " , " + Test1[i].lng.toString());
    }
    setState(() {});
  }
  //###############################
  // void get_mak2() async
  // {
  //   for (int i = 0; i < location_data.data.length; i++) {
  //     _markers.add(
  //       Marker(
  //         position: LatLng(location_data.data.,location_data.data["안양"]["lng"].todouble()),//위치
  //         markerId: MarkerId(location_data.data[i]["cid"]),//마커 아이디
  //         infoWindow: InfoWindow(title: location_data.data[i]["title"], snippet: "id = "+location_data.data[i]["cid"].toString())//눌렀을때의 정보
  //       )
  //     );
  //     print("Name: " + location_data.data[i]["title"]);//여기는 그냥 콘솔창에 출력
  //     print("Location: " + location_data.data[i]["lat"].toString() + " , " + location_data.data[i]["lng"].toString());
  //   }
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    _locateMe();
    //_submit();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("주변위치"),
          backgroundColor: Colors.red,
        ),//조립시에 지워야함
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _initialPosition,
              mapType: MapType.normal,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,//자신위치파란점
              myLocationButtonEnabled: false,//자기위치로카메라이동
              zoomControlsEnabled: true,
              markers: _markers.toSet(),
              // 클릭한 위치가 중앙에 표시와 동시에 에드마커
              onTap: (cordinate) {
                _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
                addMarker(cordinate);//개발자용 함수. 위치 검색후 삭제요망
              },
            ),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude,longitude),zoom: 14)));
                    },
                    child: Text("나의 위치"),
                    //child: Icon(Icons.zoom_in),
                  ),
                )
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      getNearbyPlaces();
                      get_mak();
                    },
                    child: Text("내 주변 \n상점들"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _handlePressButton();
                    },
                    child: Text("검색"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getNearbyPlacesbyMarker();
                    },
                    child: Text("검색기준\n주변위치"),
                  )
                ],
              ),
            )
          ],
        )
    );
  }


  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'kr',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country,"kr"),Component(Component.country,"kr")]);


    displayPrediction(p!,homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    mlat = lat;
    mlng = lng;

    //_markers2.clear();
    _markers.add(Marker(markerId: MarkerId(mak2count.toString()),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));
    mak2count++;
    //_markers2.toSet();
    setState(() {});

    _controller.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(lat, lng), 15.0));
  }

  void getNearbyPlacesbyMarker() async {

    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + mlat.toString() + ','
        + mlng.toString() + '&radius=' + radius + '&key=' + apiKey
    );

    print(url);
    var response = await http.post(url);


    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));
    print(nearbyPlacesResponse.results![0].name);


    for (int i =0; i<nearbyPlacesResponse.results!.length;i++) {
      double lat = nearbyPlacesResponse.results![i].geometry!.location!.lat as double;//
      double lng = nearbyPlacesResponse.results![i].geometry!.location!.lng as double;//
      _markers.add(//_markers에 더한다
          Marker(//마커를
              position: LatLng(lat,lng),//위치
              markerId: MarkerId(i.toString()),//마커 아이디
              infoWindow: InfoWindow(title: nearbyPlacesResponse.results![i].name, snippet: "id = "+i.toString())//눌렀을때의 정보
          )
      );
      print("Name: " + nearbyPlacesResponse.results![i].name!);//여기는 그냥 콘솔창에 출력
      print("Location: " + lat.toString() + " , " + lng.toString());

    }
    setState(() {});
  }
}

