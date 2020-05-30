//Expenses

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workerapp/src/Screens/WorkerDetailScreen.dart/view.dart';
import 'package:workerapp/src/Utils/ColorsTransform.dart';

class AddWorkerExpensesScreen extends StatefulWidget {
  final String userId;
  AddWorkerExpensesScreen({Key key, this.userId}) : super(key: key);

  @override
  _AddWorkerExpensesScreenState createState() =>
      _AddWorkerExpensesScreenState();
}

class _AddWorkerExpensesScreenState extends State<AddWorkerExpensesScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {"money": "", "date": "", "note": ""};

  void onSubmit(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      FirebaseDatabase.instance
          .reference()
          .child("users")
          .child(widget.userId)
          .child("expenses")
          .push()
          .set({
        "money": data['money'],
        "date": DateTime.now().toString(),
        "note": data['note'],
      });

      Get.off(WorkerDetailScreen(
        userId: widget.userId,
      ));
    }
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
            "اضافه المصروفات",
            style: GoogleFonts.cairo(
              fontSize: 18,
              color: Color(getColorHexFromStr("d63447")),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        data['money'] = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "المبلغ مطلوب";
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.cairo(
                      color: Color(getColorHexFromStr("d63447")),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "المبلغ",
                      hintStyle: GoogleFonts.cairo(),
                      fillColor:
                          Color(getColorHexFromStr("fc8210")).withOpacity(0.6),
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        data['date'] = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "التاريخ مطلوب";
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.cairo(
                      color: Color(getColorHexFromStr("d63447")),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "التاريخ",
                      hintStyle: GoogleFonts.cairo(),
                      fillColor:
                          Color(getColorHexFromStr("fc8210")).withOpacity(0.6),
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      setState(() {
                        data['note'] = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "الملاحظه مطلوبه";
                      } else
                        return null;
                    },
                    maxLines: 5,
                    style: GoogleFonts.cairo(
                      color: Color(getColorHexFromStr("d63447")),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "ملاحظات",
                      hintStyle: GoogleFonts.cairo(),
                      fillColor:
                          Color(getColorHexFromStr("fc8210")).withOpacity(0.6),
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onSubmit(context);
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(getColorHexFromStr("fc8210")),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "اضف",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(getColorHexFromStr("d63447")),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
