import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workerapp/src/Screens/AddWorkerExpenses.dart/view.dart';
import 'package:workerapp/src/Utils/ColorsTransform.dart';

class WorkerDetailScreen extends StatefulWidget {
  final String userId;
  WorkerDetailScreen({Key key, this.userId}) : super(key: key);

  @override
  _WorkerDetailScreenState createState() => _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
  FirebaseDatabase _firebaseDatabase;

  @override
  void initState() {
    super.initState();
    print(widget.userId);
    _firebaseDatabase = FirebaseDatabase.instance;
  }

  void _remove(String id) async{
    print(id);
   await _firebaseDatabase
        .reference()
        .child("users")
        .child(widget.userId)
        .child("expenses")
        .child(id)
        .remove();
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
          title: Text(
            "التفاصيل",
            style: GoogleFonts.cairo(
              fontSize: 18,
              color: Color(getColorHexFromStr("d63447")),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(getColorHexFromStr("fc8210")),
          onPressed: () {
            Get.to(AddWorkerExpensesScreen(
              userId: widget.userId,
            ));
          },
          child: Center(child: Icon(Icons.note_add)),
        ),
        body: StreamBuilder(
          stream: _firebaseDatabase
              .reference()
              .child("users")
              .child(widget.userId)
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> result) {
            print(result.data.snapshot.value.containsKey("expenses"));
            List<Map<String, dynamic>> allExpenses = [];
            if (result.data.snapshot.value.containsKey("expenses")) {
              (result.data.snapshot.value['expenses'] as Map)
                  .forEach((key, value) {
                print(value);

                allExpenses.add({
                  "id": key,
                  "money": value['money'],
                  "date": value['date'],
                  "note": value['note'],
                });
              });
            }

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Color(getColorHexFromStr("d63447")),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          result.data.snapshot.value['name'] ?? "",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            // color: Color(getColorHexFromStr("fc8210")),
                            color: Color(getColorHexFromStr("d63447")),
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
                              result.data.snapshot.value['phone'] ?? "",
                              style: GoogleFonts.cairo(
                                fontSize: 15,
                                color: Color(getColorHexFromStr("d63447")),
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
                              result.data.snapshot.value['address'] ?? "",
                              style: GoogleFonts.cairo(
                                fontSize: 15,
                                color: Color(getColorHexFromStr("d63447")),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        result.data.snapshot.value['expenses'] == null ||
                                allExpenses.isEmpty
                            ? Center(
                                child: Text(
                                "لا يوجد مصروفات",
                                style: GoogleFonts.cairo(),
                              ))
                            : ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                itemCount: allExpenses.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: double.infinity,
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  "التاريخ :",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  allExpenses[index]['date'] ??
                                                      "",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  "السعر :",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  allExpenses[index]['money'] ??
                                                      "",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  "الملاحظات :",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  allExpenses[index]['note'] ??
                                                      "",
                                                  style: GoogleFonts.cairo(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: InkWell(
                                              onTap: () {
                                                _remove(
                                                    allExpenses[index]['id']);
                                              },
                                              child: Icon(Icons.close)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
