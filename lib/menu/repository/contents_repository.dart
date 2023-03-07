import 'dart:convert';

import 'package:second_active/menu/repository/local_storage_repository.dart';

class ContentsRepository extends LocalStorageRepository{

  Map<String, dynamic> data = {
    "안양": [
      {
      "phone" : "010-8312-5647",
      "cid": "1",
      "image": "assets/image/cu.png",
      "title": "안양5동 CU",
      },
      {
        "phone" : "010-4782-5427",
        "cid": "2",
        "image": "assets/image/gs25.png",
        "title": "안양5동 GS25",
      },
      {
        "phone" : "010-8302-1247",
        "cid": "3",
        "image": "assets/image/마트.PNG",
        "title": "안양알뜰마트 CU",
      },
      {
        "phone" : "010-7892-7987",
        "cid": "4",
        "image": "assets/image/마켓.png",
        "title": "다사가라 마트",
      },
      {
        "phone" : "010-4792-2387",
        "cid": "5",
        "image": "assets/image/1.png",
        "title": "엄청싼 마트",
      },
      {
        "phone" : "010-8492-4237",
        "cid": "6",
        "image": "assets/image/2.png",
        "title": "대박싼 마트",
      },
      {
        "phone" : "010-1492-4577",
        "cid": "7",
        "image": "assets/image/3.png",
        "title": "안양중앙마트",
      },
    ],

    "비산": [
      {
        "phone" : "010-2587-4135",
        "cid": "8",
        "image": "assets/image/4.png",
        "title": "비산할인마트",
      },
      {
        "phone" : "010-7632-4582",
        "cid": "9",
        "image": "assets/image/5.png",
        "title": "비산동쪽마트",
      },
      {
        "phone" : "010-1527-7546",
        "cid": "10",
        "image": "assets/image/6.png",
        "title": "비산슈퍼마켓",
      },
      {
        "phone" : "010-7312-4577",
        "cid": "11",
        "image": "assets/image/cu.png",
        "title": "비산1동 CU",
      },
      {
        "phone" : "010-1234-3147",
        "cid": "12",
        "image": "assets/image/gs25.png",
        "title": "비산2동 GS25",
      },
      {
        "phone" : "010-4572-5769",
        "cid": "13",
        "image": "assets/image/마트얌.png",
        "title": "비산알뜰마트 CU",
      },
      {
        "phone" : "010-3457-8286",
        "cid": "14",
        "image": "assets/image/슈퍼마켓.png",
        "title": "다팔아라 마트",
      },
    ],

    "박달": [
      {
        "phone" : "010-4789-1345",
        "cid": "15",
        "image": "assets/image/7.png",
        "title": "박달중앙마트",
      },
      {
        "phone" : "010-4523-7941",
        "cid": "16",
        "image": "assets/image/8.png",
        "title": "박달할인마트",
      },
      {
        "phone" : "010-4561-7823",
        "cid": "17",
        "image": "assets/image/9.png",
        "title": "비산슈퍼마켓",
      },
      {
        "phone" : "010-5624-2894",
        "cid": "18",
        "image": "assets/image/10.png",
        "title": "비산다나와마트",
      },
      {
        "phone" : "010-2347-7895",
        "cid": "19",
        "image": "assets/image/11.png",
        "title": "비산저렴마트",
      },
      {
        "phone" : "010-1478-4236",
        "cid": "20",
        "image": "assets/image/cu.png",
        "title": "비산 CU",
      },
      {
        "phone" : "010-4789-1246",
        "cid": "21",
        "image": "assets/image/gs25.png",
        "title": "비산 gs25",
      },
    ],
  };



  Future<List<Map<String,String>>> loadContentsFromLocation(String location) async{
    // await Future.delayed(Duration(milliseconds: 500));
    return data[location];
  }

}