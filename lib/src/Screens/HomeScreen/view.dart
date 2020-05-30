import 'package:firebase_database/firebase_database.dart';
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
  FirebaseDatabase _dataBase;

  @override
  void initState() {
    _dataBase = FirebaseDatabase.instance;
    super.initState();
  }

  void getAllUsers() {
    _dataBase.reference().child("users").onChildAdded;
  }

  Widget workerCard({String name, String phoneNum, String address}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
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
                name ?? "",
                style: GoogleFonts.cairo(
                  fontSize: 18,
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
                    phoneNum ?? "",
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
                    address ?? "",
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

  void _remove(String id) async {
    print(id);
    await _dataBase.reference().child("users").child(id).remove();
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
        body: StreamBuilder(
          stream: _dataBase.reference().child("users").onValue,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot<Event> result) {
            if (result.hasError) {
              return Text("No Data");
            } else if (result.hasData) {
              print("-0-0-0-");
              print("data => ${result.data.snapshot.value}");
              List<Map<String, dynamic>> allUsers = [];
              (result.data.snapshot.value as Map).forEach((key, value) {
                print(value);

                allUsers.add({
                  "id": key,
                  "name": value['name'],
                  "phone": value['phone'],
                  "address": value['address'],
                });
              });
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: allUsers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(WorkerDetailScreen(
                          userId: allUsers[index]['id'],
                        ));
                      },
                      child: Stack(
                        children: <Widget>[
                          workerCard(
                            name: allUsers[index]['name'],
                            phoneNum: allUsers[index]['phone'],
                            address: allUsers[index]['address'],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  _remove(allUsers[index]['id']);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.close),
                                )),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 14,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
