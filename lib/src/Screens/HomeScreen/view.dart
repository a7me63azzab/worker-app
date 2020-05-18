import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workerapp/src/Screens/AddWorkerScreen.dart/view.dart';
import 'package:workerapp/src/Screens/WorkerDetailScreen.dart/view.dart';
import 'package:workerapp/src/Utils/ColorsTransform.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget workerCard({String name, String phoneNum, String address}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Color(getColorHexFromStr("d63447")),
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              // color: Color(getColorHexFromStr("d63447")),
              // borderRadius: BorderRadius.only(
              //     bottomRight: Radius.circular(10),
              //     topRight: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage("assets/icons/engineers.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'احمد عبدالمنعم محمد عزب',
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  // color: Color(getColorHexFromStr("fc8210")),
                  color: CupertinoColors.black,
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone_android,
                    color: CupertinoColors.systemYellow,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '01281810921',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: CupertinoColors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: CupertinoColors.systemYellow,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'برمكيم - ديرب نجم',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: CupertinoColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(getColorHexFromStr("f6eedf")),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(getColorHexFromStr("fc8210")),
          title: Image.asset(
            "assets/icons/repair-tool.png",
            width: 40,
            height: 40,
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(getColorHexFromStr("fc8210")),
          onPressed: () {
              Get.to(AddWorkerScreen());
          },
          child: Center(child: Icon(Icons.person_add)),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
                          return Divider();
                        },
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Get.to(WorkerDetailScreen());
                  },
                  child: workerCard());
            }),
      ),
    );
  }
}
