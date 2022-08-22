import "dart:convert";
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:madmooon/paths.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../colors.dart';
import '../home.dart';
import 'Customer_home_body.dart';



class cancelrequst extends StatefulWidget {
  final String Service_Number;
  final String parent_state;
  cancelrequst({required this.Service_Number,required this.parent_state,
  });

  @override
  _cancelrequst createState() => _cancelrequst();
}

class _cancelrequst extends State<cancelrequst> {

  TextEditingController details = new TextEditingController();
  TextEditingController Location = new TextEditingController();
  List<String> list = [];
  Future fetch_location() async {

      list.add("غالي");
      list.add("غالي جدا");
      list.add("لم الاقي رد من مقدم الخدمة");
      list.add("مقدم خدمة سيئ");
  }
  @override
  void initState() {
    fetch_location();
    super.initState();

  }
  getxCustomerHomeBody crt = Get.put(getxCustomerHomeBody());
  showLoading(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text(message,style: TextStyle(fontSize: 16),)),
            content: JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            actions: <Widget>[

            ],
          ),
        );
      },
    );
  }

  Add_rreason_cancel() async {
    showLoading("جاري الغاء الخدمة");
    var now = DateTime.now();
    if(reason==""){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى أختيار سبب الألغاء',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
      );
      Get.back();
      return;
    }
    showLoading("جاري الغاء الخدمة");
    print("******************"+reason);
    var data = {
      "cancel_date":now.toString(),
      "Requst_Service_ID": widget.Service_Number,
      "cancel_reason":reason,
      "another_reason":details.text,
    };

    Uri url =Uri.parse(Paths.Requst_Service+"cancel_requst.php");
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody) ;
    if (responsebody['status'] == "success") {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('تم الغاء الخدمة بنجاح شكراٌ لك',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
      //       fontSize: 20,
      //       fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
      // );
      crt.state!.value = "123";
      crt.state!.value =
          widget.parent_state;
      print("*"+widget.parent_state);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('هناك مشكله في الغاء الخدمة',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
      );

    }
    Get.back();
    Get.back();
  }
  String reason="";
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(height: double.infinity, width: double.infinity),
            buildPositionedtop(mdw),
            buildPositionedBottom(mdw),
            Container(
                height: MediaQuery.of(context).size.height/1.01,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                "إلغاء الخدمة",

                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25),
                              ))),

                      SizedBox(
                        height: MediaQuery.of(context).size.height/8,
                      ),
                      buildFormUpdateCategory(mdw),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height:5),
                              Obx(() {
                                return
                                  RaisedButton(
                                    color: Colors.red[700],
                                    elevation: 10,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 40),
                                    onPressed:  (){
                                      Add_rreason_cancel();
                                      // print(crt.state);
                                      // crt.state!.value = "123";
                                      // crt.state!.value =
                                      //     widget.parent_state;
                                      // print("*"+widget.parent_state);
                                     // Get.back();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          "إلغاء"+crt.nulles.toString(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 4),
                                            padding: EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  );
                              })

                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );

  }



  Center buildFormUpdateCategory(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 20),
        //height: 700,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
              color: Colors.white10,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(

            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        DropdownSearch<String>(
                          mode: Mode.MENU,
                          showSelectedItems: true,
                          maxHeight: 400,
                          showClearButton: true,
                          popupBackgroundColor: Colors.white,
                          popupBarrierColor: Colors.grey[100],
                          showSearchBox: true,

                          items: list,
                          // ["Brazil", "France", "Tunisia", "Canada"],
                          label: "أسباب الإلغاء",
                          hint: "أختر سبب لإلغاء الخدمة",
                          popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (val) {
                            Location.text = val!;
                            setState(() {
                              reason=val;
                            });
                          },
                          //selectedItem: selectedItem
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Start Text Username
                    Text(
                      "يرجى كتبه تفاصيل سبب الإلغاء إن وجدت لتحسين خدمتنا لك",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: details,
                        minLines: 2,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: 'ماهو سبب الغاءالخدمة',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            )
                        ),
                      ),
                    ),

                    // End Text username


                    // End Text username


                  ],
                ),
              ),
            )),
      ),
    );
  }





  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
          scale: 1.3,
          child: Transform.translate(
            offset: Offset(0, -mdw / 1.7),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mdw),
                    color: Colors.blue)),
          ),
        ));
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 1.5,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: Colors.grey[800]!.withOpacity(0.3))));
  }
}

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              Text("Loding ... "),
              CircularProgressIndicator()
            ],
          ),
        );
      });
}

showDialogAll(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: <Widget>[
            FlatButton(
              child: Text("done"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      });
}