import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workerapp/src/Screens/AddWorkerScreen.dart/service.dart';
import 'package:workerapp/src/Screens/HomeScreen/view.dart';
// import 'package:workerapp/src/Screens/AddWorkerScreen.dart/service.dart';
import 'package:workerapp/src/Utils/ColorsTransform.dart';

class AddWorkerScreen extends StatefulWidget {
  AddWorkerScreen({Key key}) : super(key: key);

  @override
  _AddWorkerScreenState createState() => _AddWorkerScreenState();
}

class _AddWorkerScreenState extends State<AddWorkerScreen> {
  AddWorker addWorker = AddWorker();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = {"name": "", "phone": "", "address": ""};

  void _submit(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      addWorker.addNewworker(
          name: userData['name'],
          phone: userData['phone'],
          address: userData['address']);
      Get.off(HomeScreen());
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
            "اضافه عامل جديد",
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.cairo(
                    color: Color(getColorHexFromStr("d63447")),
                  ),
                  onSaved: (value) {
                    setState(() {
                      userData['name'] = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "يجب ادخال الاسم";
                    } else {
                      return null;
                    }
                  },
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
                    hintText: "اسم العامل",
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
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.cairo(
                    color: Color(getColorHexFromStr("d63447")),
                  ),
                  onSaved: (value) {
                    setState(() {
                      userData['phone'] = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "يجب ادخال رقم الجوال";
                    } else {
                      return null;
                    }
                  },
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
                    hintText: "رقم المحمول",
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
                  style: GoogleFonts.cairo(
                    color: Color(getColorHexFromStr("d63447")),
                  ),
                  onSaved: (value) {
                    setState(() {
                      userData['address'] = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "يجب ادخال العنوان";
                    } else {
                      return null;
                    }
                  },
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
                    hintText: "العنوان",
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
                  _submit(context);
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
    );
  }
}
