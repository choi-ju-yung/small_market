import 'package:flutter/material.dart';
import 'package:second_active/ChatScreen.dart';
import 'package:second_active/menu/repository/contents_repository.dart';


class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  late ContentsRepository contentsRepository;
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size; // 핸드폰 크기에 맞게 사이즈 알아서 조절
  }

  bool isMyFavoriteContent = false;

  @override
  void initstate() {
    super.initState();
    isMyFavoriteContent = false;
    contentsRepository = ContentsRepository();
  }

  Widget _makeSliderimage() {
    return Container(
      child: Hero(
        tag: widget.data["cid"].toString(),
        child: Image.asset(
          widget.data["image"].toString(),
          width: size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _sellerSimpleInfo() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(
          text: "가게 이름 : ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: widget.data["title"].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ],
        )),
        RichText(
            text: TextSpan(
          text: "가게 번호 : ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: widget.data["phone"].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ],
        )),
      ],
    );
  }

  Widget _line() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.grey.withOpacity(0.3), // 투명도 조절해서 선 그은 것처럼 보이기
    );
  }

  Widget _product_list() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(
            "판매 상품",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate(
          [
            _makeSliderimage(),
            _sellerSimpleInfo(),
            SizedBox(
              height: 10,
            ),
            _line(),
            _product_list(),
          ],
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10), // 2등분
          delegate: SliverChildListDelegate(List.generate(20, (index) {
            return Container(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // 상품제목이랑 이름을 각각 위아래로 배치하기 위해서
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey,
                      height: 120,
                    ),
                  ),
                  Text(
                    "상품 제목",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "금액",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }).toList()),
        ),
      ),
    ]);
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size.width,
      height: 55,
      color: Colors.white30,
      child: Row(
        children: [
          SizedBox(
            width: 170,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMyFavoriteContent = !isMyFavoriteContent;
              });
              ScaffoldKey.currentState!.showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                    isMyFavoriteContent ? "단골마트로 찜했습니다." : "단골마트에서 찜을 해제했습니다.",
                  ),
                ),
              );
            },
            child: Image.asset(
              isMyFavoriteContent
                  ? "assets/image/풀하트.png"
                  : "assets/image/빈하트.png",
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: 70,
          ),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(widget.data["cid"].toString())),);
            },
            //   widget.data["cid"].toString() == "1" ?
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),)
            //       : Navigator.push(context, MaterialPageRoute(builder: (context) => chat1()),); },
            label: Text(
              "채팅",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(
          color: Colors.black, // 뒤로가기 아이콘 색상 변경
        ),
      ),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
