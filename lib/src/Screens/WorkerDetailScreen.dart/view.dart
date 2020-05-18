import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workerapp/src/Screens/AddWorkerExpenses.dart/view.dart';
import 'package:workerapp/src/Utils/ColorsTransform.dart';

class WorkerDetailScreen extends StatefulWidget {
  WorkerDetailScreen({Key key}) : super(key: key);

  @override
  _WorkerDetailScreenState createState() => _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
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
            Get.to(AddWorkerExpensesScreen());
          },
          child: Center(child: Icon(Icons.note_add)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20,),
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
                      'احمد عبدالمنعم محمد عزب',
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
                          '01281810921',
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
                          'برمكيم - ديرب نجم',
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                            color: Color(getColorHexFromStr("d63447")),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "التاريخ :",
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
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "الملاحظات :",
                                      style: GoogleFonts.cairo(),
                                    ),
                                  ],
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
        ),
      ),
    );
  }
}
